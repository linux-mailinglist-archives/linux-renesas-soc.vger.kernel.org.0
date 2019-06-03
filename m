Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 648B9332C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 16:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbfFCOza (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 10:55:30 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36267 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbfFCOza (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 10:55:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so13855739lfc.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2019 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AiUmShF1TFYfEnrTnq8ylFOCc8dwqFIR5n8ciUX6ZDc=;
        b=FWlAv2oqofC0HveTPQj6pgKA0ODgfWTyOkHD73zXbNOpwew2u01CEccwDMbg8xOfwj
         qoIf5IZsX45ZIQ/SN/YWv9kUfblvIEwAA15+glum6UxU9WxNEU4kb+v+JMgJxzrqiaXm
         SN/rdCeNy33F72WpsBA28F8AYn6jlw3xqZukqbu/oux1AHxZnE2bomRGvr+4kg8386L8
         c/YC4bQe7OLMB98aaLZajOxXPr76r+KBBZvOr0hb8lYhyqkxpKIG9hIuznFqisty+Kgb
         k1hMNVn9joBhJO8bAyUvLYy54VCo9t3JvufuY7tH1oPLAcY+46wX72sc6LsqdEtepfvW
         COoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AiUmShF1TFYfEnrTnq8ylFOCc8dwqFIR5n8ciUX6ZDc=;
        b=pF7XnRI8XLSeV0BzQgf8uNWGjFAvDJ5MbDdHhl3JvAG8+LjMSGWaC45G9zZXQPg6uS
         SrOTq/uukVZInhm93au2HDrstJ92oskx4XQkidInTxb/GFlB/YVU60Ux1sVpU1PnlRXo
         //nUTLykV6H/UrcRZyVwEtivqaFMfmOf0SHxh4hbn/+sunzHH/lCAPcQRXd4LT2ZwM3M
         EhtkO3KR5bgIzoqUCORG8MX9HmNMo0XnbkISzr20WodEoD4C24Ng4XhISjR1glW32zHt
         mWzyd6gp4YDqGM6QmsGpKQgrk9hGF3QYSrktN1z+DIdv3EAHnSLw6BtGyY79nLIYhJOB
         rNxg==
X-Gm-Message-State: APjAAAXJWvmXphjtoCyQP06ZQfZBZCr6RRir87MLGzO9ghv9bvWbQxOj
        Slh/FQL4eZB2a/4oRU59OcAhgg==
X-Google-Smtp-Source: APXvYqw9F4Sn8LW63elkx8IeVf8s9Dj+/X4dQVCrdVlmRuu3411BzVexm1RAj/M0H+0Tv+juZWmcXQ==
X-Received: by 2002:ac2:424b:: with SMTP id m11mr13396166lfl.163.1559573728137;
        Mon, 03 Jun 2019 07:55:28 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.227])
        by smtp.gmail.com with ESMTPSA id q22sm1236395lje.75.2019.06.03.07.55.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 07:55:27 -0700 (PDT)
Subject: Re: [PATCH v13 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3
 RPC-IF controller bindings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, bbrezillon@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, juliensu@mxic.com.tw,
        Simon Horman <horms@verge.net.au>, miquel.raynal@bootlin.com
References: <1558423174-10748-1-git-send-email-masonccyang@mxic.com.tw>
 <1558423174-10748-4-git-send-email-masonccyang@mxic.com.tw>
 <0e2994d6-6efc-9f36-f681-609199f20b9f@cogentembedded.com>
 <20190603130428.GX4797@dell>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <02addf64-9f6e-ccc1-2f94-8983456e3ebc@cogentembedded.com>
Date:   Mon, 3 Jun 2019 17:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190603130428.GX4797@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06/03/2019 04:04 PM, Lee Jones wrote:

>>> Document the bindings used by the Renesas R-Car Gen3 RPC-IF controller.
>>>
>>> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
>>> ---
>>>  .../devicetree/bindings/mfd/renesas-rpc-if.txt     | 65 ++++++++++++++++++++++
>>>  1 file changed, 65 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt b/Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt
>>> new file mode 100644
>>> index 0000000..20ec85b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/renesas-rpc-if.txt
>>> @@ -0,0 +1,65 @@
>>> +Renesas R-Car Gen3 RPC-IF controller Device Tree Bindings
>>> +---------------------------------------------------------
>>> +
>>> +RPC-IF supports both SPI NOR and HyperFlash (CFI-compliant flash)
>>> +
>>> +Required properties:
>>> +- compatible: should be an SoC-specific compatible value, followed by
>>> +		"renesas,rcar-gen3-rpc" as a fallback.
>>> +		supported SoC-specific values are:
>>> +		"renesas,r8a77995-rpc"	(R-Car D3)
>>> +- reg: should contain three register areas:
>>> +	first for RPC-IF registers,
>>> +	second for the direct mapping read mode and
>>> +	third for the write buffer area.
>>> +- reg-names: should contain "regs", "dirmap" and "wbuf"
>>> +- clocks: should contain 1 entries for the module's clock
>>> +- clock-names: should contain "rpc"
>>> +- power-domains: should contain system-controller(sysc) for power-domain-cell
>>> +- resets: should contain clock pulse generator(cpg) for reset-cell,
>>> +	  power-domain-cell and clock-cell
>>
>>    That's just some nonsense, sorry...
>>    I suggest that you stop reposting your patches as I'm going to post
>> my version of this patchset RSN (based on your patches, of course) and I'm
>> going to take care of fixing this file as well.
> 
> Why is this necessary?

   Because Mason doesn't want to develop the HyperFlash driver (or even move his code
in preparation to this driver being developed). I must develop this driver, and I'd
like to avoid the extra churn of mving the code between the MFD and SPI drivers.

> Why not just provide some constructive feedback instead?

   I was providing the feedback during these 13 revisions... unfortunately, it wasn't
fully considered.

>>> +- #address-cells: should be 1
>>> +- #size-cells: should be 0
>> [...]

MBR, Sergei
