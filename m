Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC9BA11EA63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 19:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbfLMSgG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 13:36:06 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39715 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbfLMSgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 13:36:06 -0500
Received: by mail-lf1-f65.google.com with SMTP id y1so8617lfb.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2019 10:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+yYxOT0va2VHzwIKoZ6C2B0Jvut+fqhudWR3wypOJFA=;
        b=gXOWCxe5ihfQaMVe6vNWAQ0C45ZFllMGAVs+YMFtY5KzS4YCZkgJ4wYsK/Wp2lZ8oe
         wP0bj6bZ7m95r/wcDgtvV/TRyN/fxX5rQtgthfwhjOy1vWCbaDydD/tke5Ksp94azd7K
         CPQMyWG1VrtwbVmeqJ7b11LWVh8wU0aISMN3xUFl9KtwHNyML4fpdilR4GPwKBqLfyDl
         JEzDQopgu5nLhzFh/ahB9o32iYmvTedFa+pBPB+WlC8D9u6GfFhVKIqil58xWiTyFzSm
         pr+zfMORBeMCMoZxguRCNt3Z6U3Q61aqCHqQmQEaEqljtmXYhnlg4Muw/PdF+QUF6PaV
         aX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+yYxOT0va2VHzwIKoZ6C2B0Jvut+fqhudWR3wypOJFA=;
        b=VjZNA0+eomE9BQ0zgQ+oFg8JfPslmG557k+/QhjhoWBhow3ZHKltYbq6OgWOvjgkuH
         edRQAo/dnYd7OaW/kx/d/XcJud+anwsQ7C083mzKkT5RWkdnyAd8FXYMQsVQLXnWa1NQ
         GNj5c1/2BzrlaXM1gAQMCXUbqhdOG3qCr32QtjbzdRpJAgTSPsWpnFyWz8qzk8XuHOJi
         WauOBuq3iYrtcHabUepB9EVbPqwbCmYG/3Mg5brar73b1p/lwfBcWRRQSRLRFgMgsCCQ
         Hic2EbJA3RBA3t1dXfkZyDyJsbx6f7N2YjIiRvYrDEBCZhHjnkXQ5F1uD0kUniqHJ+XF
         l67g==
X-Gm-Message-State: APjAAAXCDPaF8Q5RrHwuIJ0F38n+AzpHx7CEyx3dAbSLFp70/DgGBI/m
        esfmB8oivUrSapkMSVpKBq2awQ==
X-Google-Smtp-Source: APXvYqyDjih2mzXZ55CgIu55UJmQthpr1+7SQHKDRtszvEjE6rL8yimdlW9KpwfQfkfbrr7hqkz4dw==
X-Received: by 2002:a19:4901:: with SMTP id w1mr9751553lfa.168.1576262164329;
        Fri, 13 Dec 2019 10:36:04 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:42e:41d4:b11e:4c1d:868f:dabe])
        by smtp.gmail.com with ESMTPSA id p136sm5111088lfa.8.2019.12.13.10.36.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Dec 2019 10:36:02 -0800 (PST)
Subject: Re: [PATCH v2 1/6] spi: Add SPIBSC driver
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <20191206134202.18784-2-chris.brandt@renesas.com>
 <37c13497-d20f-583f-72d7-1e3c8a241990@cogentembedded.com>
 <TYXPR01MB1568ED4D40CEC399E64F6A2B8A550@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <7386b38f-2f52-39cb-3887-e97b024ec563@cogentembedded.com>
Date:   Fri, 13 Dec 2019 21:36:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TYXPR01MB1568ED4D40CEC399E64F6A2B8A550@TYXPR01MB1568.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 12/12/2019 11:19 PM, Chris Brandt wrote:

>>    As you can see, the deleted file is back after unmount/re-mount...
> 
> Did you do a 'sync' before you unmounted?

   Now I have -- no change.

> With the RZ/A2M EVB:
> 
> Welcome to Buildroot
> buildroot login: root
> $ mount /dev/mtdblock3 -t jffs2 /mnt
> $ ls -l /mnt
> total 688
> -rwsr-xr-x    1 root     root        703448 Oct 31 09:08 busybox
> -rw-r--r--    1 root     root             6 Oct 31 09:07 hello.txt
> $ rm hello.txt
> $ sync
> $ umount /mnt
> $
> $
> $ mount /dev/mtdblock3 -t jffs2 /mnt
> $ ls -l /mnt
> total 687
> -rwsr-xr-x    1 root     root        703448 Oct 31 09:08 busybox
> 
> 
> Note that I also needed this patch in my tree.
> https://patchwork.ozlabs.org/patch/1202314/

   I should have mentioned that I was testing in Simon's renesas.git (thus 5.2-rc6),
this patch is not applicably there. I'll now try Geert's renesas-devel.git (5.5-rc1)...

> Chris

MBR, Sergei
