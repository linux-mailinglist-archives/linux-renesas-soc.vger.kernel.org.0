Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EEC1D789C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 14:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgERM3M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 08:29:12 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44810 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgERM3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 08:29:12 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04ICT7vQ072728;
        Mon, 18 May 2020 07:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589804947;
        bh=z601Tk+WpSn6Our9WFyIvedr6ICYwKMq0RZal4bupvg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=skaxXJe9qN4wReZXTA9c8kSvaiL8zy3K6dl7i2MJ3MM3AbimCNL4vZcAICbg/rO8V
         rnEoY5WjSxaqwzUFKc0oNwUX8VQqXJ1bMZkQFHsKZAwu5HrW4+YMA28yWX7UcMGXjp
         cVC+iIgejYuvYln/ZutxkcsQ8YS4vSPGkYXPX5zg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04ICT7vC012521
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 May 2020 07:29:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 07:29:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 07:29:07 -0500
Received: from [10.250.233.85] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04ICT5Rf101717;
        Mon, 18 May 2020 07:29:05 -0500
Subject: Re: [PATCH v4 0/4] dt-bindings: phy: add r8a77961 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692334705CC2191432F3178D8BC0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <5236d074-074f-2c65-1a5f-54bb8490af2c@ti.com>
Date:   Mon, 18 May 2020 17:59:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB3692334705CC2191432F3178D8BC0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 5/14/2020 2:56 PM, Yoshihiro Shimoda wrote:
> Hi Kishon,
> 
>> From: Yoshihiro Shimoda, Sent: Friday, March 27, 2020 6:34 PM
>>
>> This patch adds USBPHY 2.0/3.0 devices support for r8a77961
>> (R-Car M3-W+).
> 
> Would you apply this patch series to your repository?
> Or, should I resend?
> 
> JFYI:
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=262633

merged them now, thanks!

-Kishon
> 
> Best regards,
> Yoshihiro Shimoda
> 
>> Changes from v3:
>>  - Retain a description of #phy-cell in patch 1/4.
>>  - Add Reviewed-by in patch 1/4 and 3/4.
>>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=262507
>>
>> Changes from v2:
>>  - Modify json-schema files which Geert-san was pointed out.
>>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261847
>>
>> Changes from v1:
>>  - Rebase these patches on top of my patches of convert bindings to
>>    json-schema.
>>  - Add Reviewed-by.
>>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261195
>>
>> Yoshihiro Shimoda (4):
>>   dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
>>   dt-bindings: phy: renesas: usb2-phy: add r8a77961 support
>>   dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema
>>   dt-bindings: phy: renesas: usb3-phy: add r8a77961 support
>>
>>  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 ------------
>>  .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  52 ---------
>>  .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 117 +++++++++++++++++++++
>>  .../devicetree/bindings/phy/renesas,usb3-phy.yaml  |  79 ++++++++++++++
>>  4 files changed, 196 insertions(+), 122 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
>>  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
>>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
>>
>> --
>> 2.7.4
> 
