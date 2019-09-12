Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D35B0C1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 12:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbfILKAx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 06:00:53 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40315 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730185AbfILKAx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 06:00:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id d17so968036lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Sep 2019 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dgRHe0c0zALMw2TSjbVcveDJfiRQV5j8z+Nv6bZbiTU=;
        b=mCEYHaiknSmh86XK9e03fuskcmgH8JP35BlF2mnj8P4vGddGJJgDkO/Str6PuZEhFJ
         d1fle7Bp5qw0FZd+YOjt95a0BFr8sjKu/UFAH71NB9BQCF4OHxyjt/l4GlrD0mLiyCKi
         EJQMNGKGNGxIjoUeqvg1dQE42v79xFegUa/urL4rV/iW82qETF9ASs4Ccy2vZ6ZnZfHP
         j/E78UGKbUBPikmsnuhGu5RTZvizM6pCJWCRHTW2/TADq0WVYYtam+IVUg5vuoiRH5wR
         yNMqSxXHLuxHo+ZVGVanOpH2wvBnUYyKzJAE6AE508a5anSURDrhzQ/6wEZMghOXdXtF
         owNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dgRHe0c0zALMw2TSjbVcveDJfiRQV5j8z+Nv6bZbiTU=;
        b=D4o1BbVfpXZXO7sIgHq9ZmGpb5bcd05XTEWhSt6Xgp/zVnHsZ8t5xkNa0qHlxxblvW
         gWpBxtRXInPxFfHydfbnZg8TKIDeIDWFZHCr0TwIRZ+rJwGJLaVFl7OrBTSt8/JOR0G/
         cLI56kR+ZfPJv+IOlRA/5E7HxAS3ETjYfYrW+GyJIukS+a2E6NxtOM/7jONDBu8GliFb
         X9DtiNtsyHQwQoZ80gkLrAmgAqMqOBs2uJdp53VsXyjmwv2Apxz8XddJT6VQDzxhmKFF
         2SJwAZ9xSiC5Azs+gIjjmRPosP6AU6cyzdbaZaRJ6Dxf6HhdkjdozwURnW6qFbqf9Obc
         s/NA==
X-Gm-Message-State: APjAAAV+DFsUL4WTiZlgstvENvMUs6gIfCEj3nEL4v0zSxTfJL3WQxf3
        QP4pUU1KUEI64FWJbM/ShweIqg==
X-Google-Smtp-Source: APXvYqxc4YkOSQULHhzw8UnouJkwyCr3fFXRTqlNg0o1TvAscvTc+8yVIN44zsSWfVizJCzuqCdaKg==
X-Received: by 2002:a19:8017:: with SMTP id b23mr26387068lfd.132.1568282451053;
        Thu, 12 Sep 2019 03:00:51 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4458:7c96:687f:e13:db32:8101? ([2a00:1fa0:4458:7c96:687f:e13:db32:8101])
        by smtp.gmail.com with ESMTPSA id l3sm6122626lfc.31.2019.09.12.03.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 03:00:49 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
Date:   Thu, 12 Sep 2019 13:00:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 11.09.2019 22:25, Kieran Bingham wrote:

> Add direct support for the r8a77980 (V3H).
> 
> The V3H shares a common, compatible configuration with the r8a77970
> (V3M) so that device info structure is reused.

    Do we really need to add yet another compatible in this case?
I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
a patch like this one didn't get posted by me.

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
[...]

MBR, Sergei
