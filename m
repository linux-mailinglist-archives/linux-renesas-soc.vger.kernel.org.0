Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6CB462EE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 09:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbhK3IzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 03:55:25 -0500
Received: from mail.iot.bzh ([51.75.236.24]:56815 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhK3IzZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 03:55:25 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 36FF12436F;
        Tue, 30 Nov 2021 09:52:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=GS578Pf/W+3gZBOFYxdte19YQM
        Runtbva4rS205J9Ug=; b=Pq3xS8NGqNA7FlNXdyNXv+dH1AQD+r2KVs3q2iEqj9
        fN5b3VeZYsyCnVNYkRYx33RJGX6rfkDlg2L6DAYh4qIK8kMCd0nNCCbodLAiujwc
        XgRpNMmin2YwIkgW5Kkh27d5VxpeOiZEiZudl191SRCp63CPiJtro8OODL5KZet7
        XJZ9+KYqNyLNubIHqEUQoPryuSTjBT4LcjzBMg0oHy9HZAIAvoYll91tcFAtatRr
        HhTm/CKv+RyzwmFEqpt5VgJVAJlfUJdbm+qKwlpSQLqoF/Sh1Jh88AuohoayhcZM
        c7frZ5eNK6+QGRhZcvuykx58G4hvrZE8FmtDZ5Sac14Q==
Message-ID: <747b22c3-15e1-852b-4729-e76898a01b47@iot.bzh>
Date:   Tue, 30 Nov 2021 09:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 1/3] dt-bindings: remoteproc: Add Renesas R-Car
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-2-julien.massot@iot.bzh>
 <YaVNpcv/R/iKxn1w@robh.at.kernel.org>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <YaVNpcv/R/iKxn1w@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On 11/29/21 23:01, Rob Herring wrote:
> On Mon, Nov 15, 2021 at 02:50:30PM +0100, Julien Massot wrote:
>> Renesas R-Car SoCs may contains a Realtime processor.
>> This patch adds binding for this remote processor.
>>
>> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
>> ---
>> Change since RFC:
>> Adds missing address-cells and size-cells and change reg cell
>> accordingly.
>> ---
>>   .../remoteproc/renesas,rcar-rproc.yaml        | 66 +++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>> new file mode 100644
>> index 000000000000..dcb6b0f75dda
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Renesas R-Car remote processor controller bindings
>> +
>> +maintainers:
>> +  - Julien Massot <julien.massot@iot.bzh>
>> +
>> +description: |
>> +  This document defines the binding for the remoteproc component that loads and
>> +  boots firmwares on the Renesas R-Car family chipset.
>> +  R-Car gen3 family may have a realtime processor, this processor share peripheral
>> +  and RAM with the host processor with the same address map.
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,rcar-cr7
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  memory-region:
>> +    description:
>> +      List of phandles to the reserved memory regions associated with the
>> +      remoteproc device. This is variable and describes the memories shared with
>> +      the remote processor (e.g. remoteproc firmware and carveouts, rpmsg
>> +      vrings, ...).
>> +      (see ../reserved-memory/reserved-memory.yaml)
>> +
>> +required:
>> +  - compatible
>> +  - resets
>> +  - memory-region
>> +  - power-domains
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
>> +    #include <dt-bindings/power/r8a7795-sysc.h>
>> +    reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        cr7_ram: cr7_ram@40040000 {
>> +            no-map;
>> +            reg = <0x0 0x40040000 0x0 0x1fc0000>;
>> +        };
>> +    };
>> +
>> +    cr7_rproc: cr7 {
>> +        compatible = "renesas,rcar-cr7";
>> +        memory-region = <&cr7_ram>;
>> +        power-domains = <&sysc R8A7795_PD_CR7>;
>> +        resets = <&cpg 222>;
>> +        status = "okay";
> 
> Don't show status in examples.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
Thanks,
Will remove the status, and add your Reviewed-by tag in the v2.

Regards,
-- 
Julien Massot [IoT.bzh]

