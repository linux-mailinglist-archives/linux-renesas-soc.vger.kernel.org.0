Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D9C1510A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2020 21:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgBCUBJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 15:01:09 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41567 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgBCUBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 15:01:09 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so16015665ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Feb 2020 12:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wLwkmwONSobT2m0KSkSOLcMc2k46DeHY097y4HJCxhI=;
        b=T/ZT47XJjTmooTq2o8OQM721kQVh3YRGZpy8jzkzja/UPfcsGT8JU9PoJOxO5oPyQL
         nsDWf1NmjwN1bUgApCR+RMnKXg0Yral5nv7H1cEz3/pzo6u/OCy/GGmTdeFvmtdn5e4w
         mMfmRpILj+u5jPIgVUTZGDPaiHRVONdcsgVag+FleynffKseZ9D+fo1P4EdEbcI6V4bP
         4BVRVkE0LOeJwMDeXvQIrWueFws3jhkMXoKvwxBoyG/8jSI3uoKFoZmuDVuFT7+YA3Ej
         Jg8l5+p9gieKvkLXcx3XLFqWCA7NaIoQTgnkaRc86ERkB82199FwIpIy1hTcU0d+Yiu1
         waKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wLwkmwONSobT2m0KSkSOLcMc2k46DeHY097y4HJCxhI=;
        b=CoATVqeZ51AsWIxcm4wW9diKuXSOTS8QHc/1P3nMvBTTgMeEIyYdWnuq5t9xy9dDXL
         gKAvSphIanJoyu3F7DZ6TYTssuuAtlICQSXKltqcJ7QVaYJVoNQ2GYyofzyLfzk3VT9B
         9mNYYGHpk2Z2ez4oDhqDLivrursaVzOS40VJjGReDD+N0HvdFllDkfbjq5zz7N6os2be
         9pkW6Zbc3Img4WN5mYGzhi5Vof8gnfshpcPvDLhgStZansVzBTEp/6wvoGyEhlKUW25l
         1IgZSTbKWsQ3nEHdQPVuTVxLMl9e/dKXjP15XdB/+iBgfVZB4a+5osMc6p+ToNY5bPQM
         r5dQ==
X-Gm-Message-State: APjAAAWAP343hvqZ6KL0/68u64gahOOrYosVXeOcj9dNgu+bgEpxawKN
        yS0x9lC+Mt6hlCKah9E6zcG2bw==
X-Google-Smtp-Source: APXvYqxg91/b9Z7X1FEuuNWFUlcBOsBLZVOXixAHTDz1SRkIHCS8GCnOGglopS/pU4NqVoaJBcXktg==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr15038520ljj.208.1580760065769;
        Mon, 03 Feb 2020 12:01:05 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:466f:add8:5793:bc04:7360:f621])
        by smtp.gmail.com with ESMTPSA id a9sm9618075lfk.23.2020.02.03.12.01.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 12:01:05 -0800 (PST)
Subject: Re: [PATCH RFT 5/5] sh_eth: use Gigabit register map for R7S72100
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Cc:     Chris Brandt <chris.brandt@renesas.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
 <a28c0b63-b221-07fa-c89c-d82ae70d0c7a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ca85d2cb-1481-fe1e-7113-5d5d667dcd5e@cogentembedded.com>
Date:   Mon, 3 Feb 2020 23:01:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a28c0b63-b221-07fa-c89c-d82ae70d0c7a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/03/2020 10:51 PM, Sergei Shtylyov wrote:

> The register maps for the Gigabit controllers and the Ether one used on
> RZ/A1  (AKA R7S72100) are identical except for GECMR which is only present
> on the true GEther controllers.  We no longer use the register map arrays
> to determine if a given register exists,  and have added the GECMR flag to
> the 'struct sh_eth_cpu_data' in the previous patch, so we're ready to drop
> the R7S72100 specific register map -- this saves 216 bytes of object code
> (AArch gcc 4.8.5).

   Oops, it's called AArch64!

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
