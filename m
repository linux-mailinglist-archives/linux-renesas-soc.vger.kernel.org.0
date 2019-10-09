Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B93D0F40
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbfJIMzq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:55:46 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45414 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730901AbfJIMzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:55:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99CtIGm074801;
        Wed, 9 Oct 2019 07:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570625718;
        bh=4F8IOaFmkDhgqK8FE/8gEilQXn6BOCg0bJtfF8lkjrY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GqJseYgpd9K4vZVbDRuKQvj71KsUkK6ls2rHcN5eOm/Zi5ybeORbW8VuP1LUP32e9
         lNIYP9J7UoDML5+aqouDO2BB0rKR5wcgdi4/wxehBuG89C6yOd/Da1urzdKX4QqWIL
         6CvzVf9orzMdY89aUU8yEywj3xcQzybKAAMTd+es=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99CtI8L103817
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 07:55:18 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 07:55:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 07:55:15 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99CtCTN103470;
        Wed, 9 Oct 2019 07:55:15 -0500
Subject: Re: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
 <OSAPR01MB30894A7D5FE7983ED0D6E5B5D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103A204D26A26D5C8E35F3DB89D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <8ecdceea-a698-7f6a-7a33-4684b9e139c6@ti.com>
Date:   Wed, 9 Oct 2019 18:24:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103A204D26A26D5C8E35F3DB89D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 01/10/19 12:09 PM, Biju Das wrote:
> Hello Kishon,
> 
> Are you happy with this patch? Please let me know.
> 
> https://patchwork.kernel.org/patch/10946601/


Can you resend the patch with the updated tags please?

Thanks
Kishon
> 
> 
> Regards,
> Biju
> 
>> Subject: RE: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
>> warning
>>
>> Hi Biju-san,
>>
>>> From: Biju Das, Sent: Thursday, May 16, 2019 10:22 PM
>>>
>>> Fix the below smatch warning by adding variable check rather than the
>>> hardcoded value.
>>> warn: array off by one? 'data->select_value[channel_num]'
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Thank you for the patch!
>>
>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>
>> Best regards,
>> Yoshihiro Shimoda
> 
