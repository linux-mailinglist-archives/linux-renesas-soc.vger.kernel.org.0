Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7371450599
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbhKONjB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:39:01 -0500
Received: from mail.iot.bzh ([51.75.236.24]:3234 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231499AbhKONiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:38:00 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 82F561B57A;
        Mon, 15 Nov 2021 14:34:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=rZI6guij8/w14rkCNcERxGdCoB
        9Aj0bsCuVWlWNBPEg=; b=KBvy+QCUDr83hIY/7Rh7/u20WKBbIyiqdwqmD2PW2o
        1cmGzVi3vX39ZZ+bksKXYAKkQLbLOuOXXb/Q+PrHqp0fckPHwN66eJfVIcT5x7ef
        W4saEbFPWhXAdchRc5ck98o8a4XRaNHmOkCvQyJzTfx97qVfqAdiM2D8BoxVlz1v
        SzGCIfh4fIUvSCz+9j3zNX6Ctrlm4oYYlRrSdg65VvD53fzOi+PDApTgAEM1vKWF
        xAQRxOBgIRpP+eCAvbtyugWWkxgx7R6XZl7NCbo8tmMN/2n82wJ3Skm+tTGS0BXd
        IK9vOkqwTjN1pbZyxA/5TCXSDlx700PGDi5l+GpjUN/w==
Message-ID: <fea8f698-ef98-2e11-a366-c32df5fd6cb2@iot.bzh>
Date:   Mon, 15 Nov 2021 14:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 1/3] dt-bindings: remoteproc: Add Renesas R-Car
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     geert+renesas@glider.be, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, mathieu.poirier@linaro.org
References: <20211027073020.17055-1-julien.massot@iot.bzh>
 <20211027073020.17055-2-julien.massot@iot.bzh>
 <1635343948.051238.862170.nullmailer@robh.at.kernel.org>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <1635343948.051238.862170.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 10/27/21 16:12, Rob Herring wrote:
> On Wed, 27 Oct 2021 09:30:18 +0200, Julien Massot wrote:
>> Renesas R-Car SoCs may contains a Realtime processor.
>> This patch adds binding for this remote processor.
>>
>> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
>> ---
>>   .../remoteproc/renesas,rcar-rproc.yaml        | 66 +++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:26.17-46: Warning (reg_format): /example-0/reserved-memory/cr7_ram@40040000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:22.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:24.39-27.15: Warning (avoid_default_addr_size): /example-0/reserved-memory/cr7_ram@40040000: Relying on default #address-cells value
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:24.39-27.15: Warning (avoid_default_addr_size): /example-0/reserved-memory/cr7_ram@40040000: Relying on default #size-cells value
> Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
> Indeed address-cells and size-cells was not specified in this binding example,
will be fixed in next version.

Thanks for the test !

Regards,
-- 
Julien Massot [IoT.bzh]

