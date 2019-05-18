Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF762224A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 May 2019 10:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbfERImb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 May 2019 04:42:31 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40347 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfERImb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 May 2019 04:42:31 -0400
Received: by mail-lf1-f66.google.com with SMTP id h13so6948158lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 May 2019 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MB+am46zdrQ7/8By7GZdXoN/QVRGNRe/Mkw8jGEPF3g=;
        b=waXbbgrfqxraHh9Df3iHVcwsQFar+ZalY+dY2SXbBvPF8SudNcrTRizlwedQCPBadz
         oRQTvD1gFAIfKaeSaRzIXu74cJk31iFPIQ+tJUFUIBO25QLEEENYoCAW9aBdjPshnTsM
         qS/56tdXwf0UqZaGZ4M7ylSBHkwUQ58wByLMEnrICDKUA1ss+4xkhIvtFeHXUBWllYsr
         +lUDsDXexV+CyYTgejJAjxGsXD+2Bt6j4excRQxMjawHc/mGIczXkDLHeAl8ktGKGo0t
         /JU2yVfagMBoK1uZLdDKq+3e2s0QLyu/QvVud0kg5YXXdrue6aq8EKf7WphQvYVVzcpe
         RFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MB+am46zdrQ7/8By7GZdXoN/QVRGNRe/Mkw8jGEPF3g=;
        b=PlwvAH65yY82+QMzUy8vOBtBGA9+lBiyd58TFlCk1w4cArjnVV/i+F/fj0RdSU5M1I
         R2JFJ4kgf3EMfT2zlbc2/sCnrTujiG56C06XMeUXxMvEq36u9h0FclnonRJUv14KheSq
         2U+A5atL8OpyEFORw2mcUiNlSpSKyfpUKslbY6r3w/4shHUJH73ztwmwsZ8vycKAfYpV
         9rqSR5uc0Fn+hWrkv8Oy/GuoDeyyJ6xBfozF9dpyu6mJ/0gYfzhogyYhVuJlflh5ZgHE
         XNfarX04tU3l83RBOF0EuMGJxYXzisK+kIJcgBlYNyz8O5gO441iecnncu5Sud4yE+xs
         nq+w==
X-Gm-Message-State: APjAAAXkycD6g50JNZSRyHkrQ2Y2+JvrnPvfnuNOywtbxfqjckYf2drm
        7nuHFSoB1lgFOyvhSnZZ34nhQg==
X-Google-Smtp-Source: APXvYqyAUNwCfxMxjD9aODqmbrWMY8YATK25Yvddy6GpZFjK4p+l+3r/sZKd8A9gpxU3B/IQIqhQDA==
X-Received: by 2002:a19:e34c:: with SMTP id c12mr8691523lfk.145.1558168949709;
        Sat, 18 May 2019 01:42:29 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.86.130])
        by smtp.gmail.com with ESMTPSA id z6sm2205931ljh.61.2019.05.18.01.42.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 01:42:29 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: writeback: include interface header
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a61ab53c-4e05-991c-f74f-802bd6222d8a@cogentembedded.com>
Date:   Sat, 18 May 2019 11:42:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 18.05.2019 0:20, Kieran Bingham wrote:

> The new writeback feature is exports functions so that they can
                             ^^ not needed?

> integrate into the rcar_du_kms module.
> 
> The interface functions are defined in the rcar_du_writeback header, but
> it is not included in the object file itself leading to compiler
> warnings for missing prototypes.
> 
> Include the header as appropriate.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
[...]

MBR, Sergei
