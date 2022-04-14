Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A163950038C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 03:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239389AbiDNBWr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 21:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239386AbiDNBWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 21:22:46 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5544DE89
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 18:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649899223; x=1681435223;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NVFAzDnsQ354GyXuIYltrailhp4dGLh0c+RSUtV89r4=;
  b=k+xrhR6o+MTdjEBG1pql5DUdU1IbXkvMPQATYN30zLvH1DebjFsiDkxU
   kP8i6sH6j3GLKULipRD0UcqlUHb67HaqkuyeRb5XpW+70pH/aoYSvTRgU
   rEMyalUGcyixUcShIv2fYXlcK46l/jUIngVNIewJRsjt18EqU/kZRXp4z
   bECWuQUG6ZH1B4kl4D+saK7Hjl2NPcmgRtffAldZPhO3EFEfpHjHcniXE
   0h9lhoPFWxARth/CLDePaVBoBa6ftNUErn/waEogtXbcOz7FNuZ9AUGNX
   ujWlJwzKTE9iIG9EfbcNb1AdS50dpDGor4IRY6UMdhLiWPozCIkAr0T/k
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,258,1643644800"; 
   d="scan'208";a="309830317"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2022 09:20:22 +0800
IronPort-SDR: Bcfza9uHbUYvozFgRcdHknqsjAjoRAWqE708nxWwDOBiaRGeh8zjw9NLwrvl3drxQJkjQ9P8SG
 +V+/lb2pyJaAREiqE0pxCvOjwPIDTA6TjYlsWJscD/mt3I3GliXzo/zVz+A3hHv113x9HW/ErE
 JFZTdtcjqyPCAEhPgaOuy26Cu05T+KVxLa95gCVkdmBbpXfyrdAhnuJmAWsV7DYcO2IHuD5NBA
 BjFssVMDDx1FExqTVHvVC2aTiVejLYe/sNRFsd/fAK/llzKYCTGMDHaBZtYVRVB9GRA8M3oo8k
 OptZwWmqLDzYe5dAXsHaKbM1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Apr 2022 17:51:35 -0700
IronPort-SDR: f30/ZtIChHKN/q7e6muboYe3lnsCCWok3n9TJ7PMXo8QNiO86nfHCylxruyF+k5RNqqSR0zDUk
 gA+T6r2N/IKChpLWAmSk2uyt/srg+iaFRY6GfdfhzY4Lqey1MynwU07dt5I32QQwRKdlAz0ImT
 IHT8BrOyUotWAvnb+rq5CzHDL2JSPFFYiFUWYuQBcLX1WbrGBMGmLBImxpvyLLnRkOkzv+Numa
 Q183BRGPAIE7EJHp1GeeTisLkzuMDN26+ciKy/hXkHTw6YJHr5ZEhJG16p0I9ExBeUoPwFJj00
 kq8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Apr 2022 18:20:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kf1q94j1hz1SVnx
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 18:20:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649899220; x=1652491221; bh=NVFAzDnsQ354GyXuIYltrailhp4dGLh0c+R
        SUtV89r4=; b=QR0L4tUNj/fPH0QWrHgWs5PvNLZOlWcAJblSDDgryZgy40/w7jv
        I3siQwzB0M/U9kw/WeHrz/xB87pRBJLR05SpUmCo+hkfdI4FLmbzy1AgdxtD7BK5
        355CzD/siJ4isBCNJDPJ85NlKdP8TB1BEsbIM2stPEEj2aWuH/Ljg3fj7nkATDLS
        xZ9Sii95lwbJpTu2DU0WIz6TkSQISFLUhUNm0p3xRjQwNB03rBSK7eUiTWWht3ZW
        hCT1K3cS0M8SnT/08/9URXqtTIvfmIH1+lfdTXMS3xT7txtIE2SdDfTLT7jJyqXx
        o1H7RRW4SxhaAzmz6SmUCWvyXbMOafLFmNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id LWiqk00yN6GA for <linux-renesas-soc@vger.kernel.org>;
        Wed, 13 Apr 2022 18:20:20 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kf1q70qcxz1Rvlx;
        Wed, 13 Apr 2022 18:20:18 -0700 (PDT)
Message-ID: <c7f6dba6-e721-b907-0597-27f636d25a32@opensource.wdc.com>
Date:   Thu, 14 Apr 2022 10:20:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [WARNING: UNSCANNABLE EXTRACTION FAILED][PATCH v2] dt-bindings:
 ata: renesas,rcar-sata: Add r8a774e1 support
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
References: <5861565a79a2bdadc07ae84e23e6d96dbb764823.1649680949.git.geert+renesas@glider.be>
 <4716ac8b-acee-da06-5fa1-34eed07ba4d0@opensource.wdc.com>
 <Yldzw63tIdKhhtA1@robh.at.kernel.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Yldzw63tIdKhhtA1@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 4/14/22 10:07, Rob Herring wrote:
> On Tue, Apr 12, 2022 at 08:05:42AM +0900, Damien Le Moal wrote:
>> On 4/11/22 21:43, Geert Uytterhoeven wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Document SATA support for the RZ/G2H SoC, no driver change required.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>> ---
>>> v2:
>>>   - Add Acked-by.
>>> ---
>>>  Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
>>> index c060c7914cae6573..c4e4a9eab658056d 100644
>>> --- a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
>>> +++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
>>> @@ -26,6 +26,7 @@ properties:
>>>        - items:
>>>            - enum:
>>>                - renesas,sata-r8a774b1     # RZ/G2N
>>> +              - renesas,sata-r8a774e1     # RZ/G2H
>>>                - renesas,sata-r8a7795      # R-Car H3
>>>                - renesas,sata-r8a77965     # R-Car M3-N
>>>            - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2
>>
>> Rob,
>>
>> Will you take this patch or do you want me to queue it ?
> 
> Please take it. If I've acked or reviewed it, I'm expecting others to 
> take.

OK. No problem. Thanks !

-- 
Damien Le Moal
Western Digital Research
