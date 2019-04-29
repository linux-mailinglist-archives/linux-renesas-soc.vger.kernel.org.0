Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9F3DC59
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 08:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfD2G4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 02:56:24 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45625 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:24 -0400
Received: by mail-lf1-f66.google.com with SMTP id t11so6944553lfl.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FZF9cclvG1CqpNtldd8ZIhldVBCl60ciGNHvB39t0uc=;
        b=lo14Wc2Eg1Qi8meppjp0KyQGfysNNICoj9ch2e7uHw6xOrq81MEuyO9xTT/mHsMN2m
         xJp7Z17zglqrJ1DTrnX5pbMnEHbcm0CI3keQsq0V0eIsQC8r8jUaz/+U0eyYcf10pEmf
         TNrvBGfXuXL8tYxBMC6S2+EGap75HrEb2E61lIRKDgegOg917vkT0QSeH0xl8reDrlRv
         rPB8YhpNoRd80l3e/ojmXuV8xJlMgKGfvxpUPF1SWt6xEIJWd8hkvMinz8jvNSrbV3Xe
         S3ghZzyUuHOKEOHNCiNdGcQ2rqC1uUDG4r0J6kWAfACgGDWrOkX+rplGNf/5hWWvNIA7
         LvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FZF9cclvG1CqpNtldd8ZIhldVBCl60ciGNHvB39t0uc=;
        b=SDbaO5zTy8D8iIMc6rrRTmfvUjc6a38smp/qUwpn5TY+hKroiSxrdNaf/BLKaVjO1J
         QqRoBR8JziwwyxQgwZYiCOckiI6goWUcjSehUvUXgokgaWhd1YwV/fgYVU5B2pJccCq3
         4/DC2lZP5CeEg//E/DV4RDX7k/a7Z0ljjAyv9H4pnB7yxVlvR78wDHMU1jFNmAg7wpNU
         8AqBqUtOANa+2sUE4CdCRJELpN4+hN+dcwr2GH9F/oP1HIgT8F0k4+UsimGRRuSOeMlH
         wi1XYk5VdFJXA61n3tD9KQCoKQ8+RBXJr8L366JeXgKXDhQa0C1IsI/YSQMPqlhGy4QB
         jlvw==
X-Gm-Message-State: APjAAAVMmO64YwvqHbiGbqBpuJUY3eLckxnDUoYBW4zICyCvXOnI6v+l
        7MvJof1cuT89N8gXPYn3W7q0Rw==
X-Google-Smtp-Source: APXvYqwzGE51HGTtXUl9Bpo6Hc+hD2rJqxX71kFcBhlSTT+F5FFBRXU3fDN+aRKucBTdkfYfBvSx8g==
X-Received: by 2002:a19:f24c:: with SMTP id d12mr31555491lfk.163.1556520982572;
        Sun, 28 Apr 2019 23:56:22 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id v14sm4088827ljj.44.2019.04.28.23.56.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:21 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:41:11 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v5.2
Message-ID: <20190429064111.yccbizwdbmby47sn@localhost>
References: <cover.1555684066.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555684066.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:35:20PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC drivers updates for v5.2.
> 
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v5.2
> 
> for you to fetch changes up to 15160f6de0bba712fcea078c5ac7571fe33fcd5d:
> 
>   soc: renesas: Identify R-Car M3-W ES1.3 (2019-03-18 10:33:42 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Drivers Updates for v5.2
> 
> * Identify R-Car M3-W ES1.3

Merged, thanks!


-Olof
