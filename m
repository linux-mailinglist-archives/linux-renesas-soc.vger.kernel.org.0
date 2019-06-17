Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3F6847D17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfFQIaM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:30:12 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33623 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbfFQIaM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:30:12 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so5873766lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eVP7yV7FVjXD+RtDOi9h4J5ouHnjPdizDZqdUE9RQ6Y=;
        b=P7FjqVVx7TED0Minxe3cgbTDKBnnbPMITuZRmWslyEvwAOpqSKSD+pwIMYE1MEDNj+
         aYoNKq/9SvOL33lLfNoSH0HjD6VDRYlqQ04xmG27bueTAibS89hi3VHqK1lhTCCoi0OW
         IKjJ3AjPUJK3tfl46Ugp0tpxJdChU+G5yrq6noIC1EwpGJjeDOExYXamzdkkFiDxDdsD
         wNZsILZ+waSNJgdmWXZSRvRd2if/0yzdUK0FfUpgVmMAc471P81POaHw4CJqi5gx6oPL
         nH6nujCxnx6gCLE/Fo5XZraiiPPh9MmBDahbnPG8prVnj2XHnGqcWIdyascbJ0CC0K9x
         vWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eVP7yV7FVjXD+RtDOi9h4J5ouHnjPdizDZqdUE9RQ6Y=;
        b=BIPAVf6rU2iqrMw8oSHA17mT93mKFObHCXglLU0hGBup/pl0OhZdmombSXi/8170jK
         jlG8ewyfm8uAn1fBvsgA/bk3JLjpWaxl9JDk1FtTBx55JWM1ZJhsJSeAn2ZxfvRWLNQD
         21v7eFb4vQBmTLy5AGun0BTVEsZZnIPcD47OfDH9lJDJH26nYl8YDdUOjQOSP5wKLcVU
         Dmxj/qcQmwox2jr7oUndZikNzG11vuPUpkkH47ok/D70QRl2FkJXsnAa9oMh5Pjh9mpy
         vZIj74fFY1Pg/hi8FoDa+moyDfRCY2ok2stu0lirTPrj9T6osfo55lUeYJnRa+/D6eqp
         ynqA==
X-Gm-Message-State: APjAAAUTBcQxCuigJlw/X8u7dnZdDEWfYXGF7fvThJh/qpAK4eLuDcOP
        MrUFCMxdpS7+42eidCABOx11Czgpl2A=
X-Google-Smtp-Source: APXvYqzoJSNUpWux0a1b4JslwzUU740S4ODwgPZVIWysLgfddKzEzELiL7xWFMIClghUthR0I6ks8A==
X-Received: by 2002:a19:c301:: with SMTP id t1mr56253772lff.137.1560760210467;
        Mon, 17 Jun 2019 01:30:10 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.84.166])
        by smtp.gmail.com with ESMTPSA id l25sm2000867lja.76.2019.06.17.01.30.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 01:30:09 -0700 (PDT)
Subject: Re: [kms-tests] [PATCH] tests: Extend BRU/BRS allocation test to
 cover M3-N
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20190617003536.30936-1-laurent.pinchart@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1786bf7c-e9e0-709e-d0a9-d5e62e41bceb@cogentembedded.com>
Date:   Mon, 17 Jun 2019 11:29:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617003536.30936-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 17.06.2019 3:35, Laurent Pinchart wrote:

> The BRU/BRS allocation test only covers the H3 ES2.0 SoC as that was the
> only hardware platform supported by the DU driver that offered the
> required features at the time the test was written. Now that M3-N is
> supported in the DU driver, support it in the test script.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   tests/kms-test-brxalloc.py | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
> index 2e3f6cb8b39e..f1902f3baf1d 100755
> --- a/tests/kms-test-brxalloc.py
> +++ b/tests/kms-test-brxalloc.py
> @@ -17,11 +17,10 @@ class BRxAllocTest(kmstest.KMSTest):
>       def main(self):
>           # This test requires usage of two CRTCs connected to the same VSPDL
>           # instance to test dynamic assignment of the BRU and BRS to pipelines.
> -        # This is only occurs on H3 ES2.0 (and M3N which we don't support yet).
> -        # Check the SoC model through sysfs as we can't detected it through the
> -        # DRM/KMS API.
> +        # This is only occurs on H3 ES2.0 and M3N. Check the SoC model through

    Not M3-N?

[...]

MBR, Sergei
