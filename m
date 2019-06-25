Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C5554FB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 15:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbfFYNEb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 09:04:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37452 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728449AbfFYNEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so16184638ljf.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BQiQmN+UX73s7noXdMSf9H5Q+xOttJ+yhOXbh7l0xvY=;
        b=T/OPDFD1M8lE95188nc8yb4y0AV6dZkjyYgKazkt0n/Z0O4IYFOMI5CA0n0BD4xv3L
         zz9nuqO2zoPJmpE5FUSSEMBcwYGx41mnz9jMoS/310TrBcoBLFI+0ifs08EqIt6D0cQy
         UYp4euofcdhx+qjQtpgevX5h5oKKDMh/D6zpU22TByhiBMi7njeRJ6qmi6EFfoYjKdV3
         i5z7JOdk23fTHaO7rlPf0xwHcdKovOOzaDL9oBpv1swFIdP0iyaptcbTR9Houbalo4aa
         2KT2a2LgWcF7UPEwBtQUtum+vH+ug8R3cccoZt1VpDhasfrMlCwCVMb6n8Z3B7OWjc8g
         HM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BQiQmN+UX73s7noXdMSf9H5Q+xOttJ+yhOXbh7l0xvY=;
        b=SwWPndv+yCgpBHPrQ3YMpWg9DCJNGssHbv6nCdxCWVvuAEx4ojLORZLizXvXn6kuGU
         JmHxjdd6jek19FWzEGpFsXxYiVQJ8STeyLI6S5AGKJhhFKZvCZ3C78PLXLcCSOfGGGib
         GoXmjjFAJ7kaYMg4k7ox8zsRwei9wqzoxDIQQeqFBWOR5n0+RZbGwhiptOVC9d1BOxYw
         T/h4FncWPiR3ykWvcTk7icyrN5+x1TbMSv3PMrfoEtjDdtlqmWLp3GjAMO/MoxU4VCNx
         bwXlw6rVk5A9/2un7CNu68YJEfXxfbh0u2f5FADX/uMxbQyKP0R0pnihCxGomU7otQp6
         r7wg==
X-Gm-Message-State: APjAAAUUCoZpeQVHLpLiXXq/q2UIgMsT69mIP9rD13ksuxRT9LQ+hg2q
        ytRgQqD5eBHLjDV/JtJO23d1YA==
X-Google-Smtp-Source: APXvYqwhsSI9XbR4XXZj4TsU3bT97jL2qpRdePwFgqTAkJfJjf+XJvXERIzekTFetfGz3GxXXChybA==
X-Received: by 2002:a2e:b0ea:: with SMTP id h10mr23132346ljl.50.1561467869057;
        Tue, 25 Jun 2019 06:04:29 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m4sm2253198ljc.56.2019.06.25.06.04.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:27 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:16:56 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v5.3
Message-ID: <20190625121656.oi47bidyhnt5aj4k@localhost>
References: <cover.1561101309.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561101309.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:14:01AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC defconfig updates for v5.3.
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v5.3
> 
> for you to fetch changes up to b995421faef5b24ee8ec60d66b356b57ca0c8b77:
> 
>   ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig (2019-05-20 13:24:06 +0200)

Merged, thanks!


-Olof
