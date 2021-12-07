Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B51946BD14
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 14:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237424AbhLGOCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 09:02:10 -0500
Received: from mail.iot.bzh ([51.75.236.24]:44922 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237422AbhLGOCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 09:02:10 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 42FD044819;
        Tue,  7 Dec 2021 14:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=S9th2APfTI6XxcTWTT4s6iJmCj
        a4Q8VizfkO5jFYODI=; b=VRJLgfzbB0wgAoePSmI/5FkRzCTH+SYfFC9N3v1whx
        QgXi9u7JkzxJzP4zYccmzGfHs4ISSa1LlEQJ9QeBbD6URkYpVBTR5foz2c5zXMs0
        iuUQhnO8B0R8vkP3uC29PXT3GW/3sfjHPu4C0GdiQ7dkcWsft3OK2QHZSHvCS9RR
        ydStxipc9OFDn4E6XwOqSLAMJaMZDxCg23lCMhmlRXb1pcZ8BvtGlt+uCloyWYE8
        hJzd+diBVeafFw2r0Y7PhEMcfA6GcB74IceEkqXBuJfC9ZQYcXDemPgF1k14A+NP
        Ut5vHFM4UL5c6JDlL6orUWlJCNwihlVVIzl1KwWuEOsA==
Message-ID: <40cee684-43d0-d060-ea3a-c0eaf1e81361@iot.bzh>
Date:   Tue, 7 Dec 2021 14:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add Renesas R-Car
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Bj=c3=b6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
References: <20211130100049.129418-1-julien.massot@iot.bzh>
 <20211130100049.129418-2-julien.massot@iot.bzh>
 <CAMuHMdUoKvgvRcQwq4fuP4WHr5me5cXKG8w0fotVO3Eqrne-2A@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdUoKvgvRcQwq4fuP4WHr5me5cXKG8w0fotVO3Eqrne-2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 12/2/21 14:22, Geert Uytterhoeven wrote:
> Hi Julien,
> 
> Thanks for your patch!
> 
> On Tue, Nov 30, 2021 at 11:01 AM Julien Massot <julien.massot@iot.bzh> wrote:
>> Renesas R-Car SoCs may contains a Realtime processor.
> 
> contain
> 
>> This patch adds binding for this remote processor.
> 
> bindings
> 
>>
>> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes since v1
>> - dropped 'status = "okay";' in the sample
>> - Add Rob's Reviewed-by tag
>>
>> ---
>>   .../remoteproc/renesas,rcar-rproc.yaml        | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>> new file mode 100644
>> index 000000000000..3fe8d49051e6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>> @@ -0,0 +1,65 @@
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
> 
> bindings
> 
>> +  boots firmwares on the Renesas R-Car family chipset.
>> +  R-Car gen3 family may have a realtime processor, this processor share peripheral
> 
> shares
> 
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
Thanks for fixing all these english mistakes.
Will resend this patch soon.

> 
> carve-out

Will keep 'carveouts' since this term is intensively used in the remoteproc core.

> 
>> +      vrings, ...).
>> +      (see ../reserved-memory/reserved-memory.yaml)
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Regards,

-- 
Julien Massot [IoT.bzh]

