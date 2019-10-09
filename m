Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48CB1D0A6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 10:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbfJII62 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 04:58:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36043 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbfJII62 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 04:58:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so1669085ljj.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2019 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vyc84S+2edb/55cLTjak1lqWHp/bz+lMyluFbJ1zjHs=;
        b=CuDTqI9jcg+9kypdeNbSItQYWvDLw0JjZlyiOSfXY946/eqc8FA2RvU855jjpXcDxZ
         aBUef/UZDZvnjDkHqCmCM8VaGkM+0u+9bPj9XXjLDkfbWKzN9AS3LOgipil4prd6Q4gB
         tglzmQEJfVcUQvwP90ymmEfZiDaMLC9GGCwhnimjayrb4M0/cuupII60+nWzASXptxQl
         60YJz3qwf/9Ze06SQrUuT+Ia2WPREYGMkxoaIWiNx66+xtdJMqJM5qhsEEAhBMDaRKeo
         Bibb4TjRPbc2FTSIUt6TasjJjDRy6aqrXW4zd+/S3WD7p804kj5yXBPkipcUp/ZraJ7h
         PIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vyc84S+2edb/55cLTjak1lqWHp/bz+lMyluFbJ1zjHs=;
        b=oTKrM/UOr0uTq2tDIdCVD5mBm9NcpoZQHQKKx/3RxlLTcihymsLE/Sf8sv7nTei4Ba
         m6h8+sklHVAzzt8gAnwvw7kUhBkdl/ufc7TOi9lBNZ/EUiVWWhWIBD2radBxTiNACRzO
         jg0KoVnX9MHax+GrsmKP0UpMMU5a3SweEn7ODryJXMSJDLVWkzaCMLW+nbswq0lFslCU
         cUY5mOt8krXgdR5t0yddN6GoGeqZ3HywFPTfuEumriBChIbkdZoFS/WJ/hrxbiC4uYFJ
         abTNf7b6+TosWzFhi48mmX0t58cWXMlxleEAmI9SsNyP6FHzHPoipZjfO/JumEpLLIXB
         rz9Q==
X-Gm-Message-State: APjAAAW+5VvAzInnSzyBO9gIi5BaYPZ2Wgt6VzbcQ4YTCZFp2agzksor
        7yjHMrn8MMROk9VjjwjE8XMTwQ==
X-Google-Smtp-Source: APXvYqw6C8nsLW8HWn4QzS8QLGS3fIKNCf1IPAYsNwclRPqKZW6Lccs7RPJY+yyi6mIFCOIl+47hSA==
X-Received: by 2002:a2e:750c:: with SMTP id q12mr1577277ljc.138.1570611506323;
        Wed, 09 Oct 2019 01:58:26 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:88d:9246:fcd9:ed2e:f8ad:568f? ([2a00:1fa0:88d:9246:fcd9:ed2e:f8ad:568f])
        by smtp.gmail.com with ESMTPSA id e17sm286520ljj.104.2019.10.09.01.58.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 01:58:25 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: rcar: Fix writing the MACCTLR register value
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <1570593791-6958-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <2b0f09cd-323d-864d-09df-40d431693f19@cogentembedded.com>
 <TYAPR01MB4544EABC75926292D3D80C0AD8950@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <822462e9-4764-6a96-b448-9b8f9f94bd3b@cogentembedded.com>
Date:   Wed, 9 Oct 2019 11:58:16 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB4544EABC75926292D3D80C0AD8950@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09.10.2019 11:54, Yoshihiro Shimoda wrote:

>>> According to the R-Car Gen2/3 manual, the bit 0 of MACCTLR register
>>> should be written to 0 because the register is set to 1 on reset.
>>
>>      The bit 0 set to 1, not the whole register (it has 1s also in the
>> bits 16-23).
> 
> Thank you for the comment. So, I'll fix the commit log as following.
> Is it acceptable?
> 
> ---
> According to the R-Car Gen2/3 manual, the bit 0 of MACCTLR register
> should be written to 0 because the bit 0 is set to 1 on reset.
> To avoid unexpected behaviors from this incorrect setting, this
> patch fixes it.

    Alright now.

> ---
> 
> Best regards,
> Yoshihiro Shimoda

MBR, Sergei
