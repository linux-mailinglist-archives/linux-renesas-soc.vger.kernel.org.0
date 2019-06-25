Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7AA54FBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 15:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfFYNFF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 09:05:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41662 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfFYNFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 09:05:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id 205so7382862ljj.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rhjA7fAZNw2Q+XRq13cvAZPnDW7DPX+n1NAELCO47tA=;
        b=LfHbIsT+MKGzl37e5b3/djYl7tNsPEoicdbf8f84U9Jc/HwPda16Ip86TC8prlKRzw
         9jr1WNfZDoPsfJHf13b2qyRIPCj+0SqUWAe3QWmQMlrQS9TIB+JHs66Norpx+BqfqdT9
         HyNj4q63nK+hTIJ7NIE3oAtdluaQ3vSSanI6jfMwXvIOegq7f3epI8dMcwFo5Gd9TvZz
         xTvohVnwcuW+FX4Lr4avIc9bF8fXpyIjEHuf6qDN9RIYEZq1I/00olWpkw4jX2jSa65Z
         sd/46f0DwcKa065kRAAiy0HW33qXQ8+ndfxxSoHgLj3GEMkjuvhn3YWkwVgLDlotidtr
         qoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rhjA7fAZNw2Q+XRq13cvAZPnDW7DPX+n1NAELCO47tA=;
        b=obm9XLK98PAqDf4W8GE2VGQepME72oz6UspUe3lznqoZhP/S8852KiMrOJSpslO5cn
         ZNbHfmqM1N0NFivgVM6792I7l6O9wt23kYfQ5KcDExvNvb9ZmvdtgVTA2E5N1pXZaVcB
         eu94ang8atkk5wZ3VZCvSYA05uA8cWVvnlp9NUGxVfHaGstynD0F/wiVYD3C1uy+OUwG
         0jccpPFKAHUuhXNiRR5DGA4VRx8z4iQCFENKLK2L1kfTCoofEM9ALldCOtqe5bATc/Nj
         yISxVnPTT2GiOnAdKYfUh7OzCz6dVZ9IzSxN2efl7bxtHtpaSkZFk83OwQ4IPJWnmtF+
         l3rg==
X-Gm-Message-State: APjAAAXylINieKlp6m5sSTQl+4DxH56EAXNB87bDHEgoBtrEUSKb5dLu
        fnw3QkXr+vSQixMWTTBa5k1kug==
X-Google-Smtp-Source: APXvYqxO7jGcSIN6o2p0xOqoXuQRSIPIC8p02T/19CY/zaU3Oj4P2pDHi25ey9bgYE90rV9DmbXdCA==
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr45947747ljk.90.1561467902864;
        Tue, 25 Jun 2019 06:05:02 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id p9sm2284328lji.107.2019.06.25.06.05.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:05:01 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:49:24 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.3
Message-ID: <20190625124924.ubpi3pxwggbz5cbw@localhost>
References: <cover.1561105093.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561105093.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:12:04AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC updates for v5.3.
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.3
> 
> for you to fetch changes up to 02af9f90941b6cce5fb672ee058c142adcc11a2f:
> 
>   soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M (2019-06-06 10:37:06 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v5.3
> 
> * Auto-enable RZ/A1 IRQC on RZ/A1H and RZ/A2M
> * Don't init CNTVOFF/counter if PSCI is available
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M
> 
> Oleksandr Tyshchenko (1):
>       ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available

Merged, thanks.

Note that in this patch, code like this:

+#ifdef CONFIG_ARM_PSCI_FW
+       if (psci_ops.cpu_on)
+               need_update = false;
+#endif
+
+       if (need_update == false)
+               goto skip_update;


Can either be replaced with a goto under the ifdef, or at the very least, no
need to do a 'need_update == false' -- 'if (need_update)' is sufficient.


-Olof
