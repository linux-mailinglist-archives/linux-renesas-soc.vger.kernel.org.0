Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031663B1CA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 16:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFWOi7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 10:38:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39956 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWOi7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 10:38:59 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 670FDEE;
        Wed, 23 Jun 2021 16:36:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624459000;
        bh=L/wBNzZnjJd2bAFhkH5cdoXL+9AZvki4Yv/iSLuDpQ8=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=rw8WGo9EbpAjI9CSE6BmDdi/7OIZZ0CYZC4J6qw0LbRWUxXt79c7IDHDt5993js6i
         0keMssK/cZUvgr+7q9PKkTc8Krg9zPqmWqcHDrk6COAY1NmUawUzA+G9H9KcB8TC1V
         2jgRxVJ4pizp1xmIFjYlhmli5RsohwPuyR8gmNNA=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH 01/15] dt-bindings: display: bridge: Add binding for
 R-Car MIPI DSI/CSI-2 TX
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210623034656.10316-2-laurent.pinchart+renesas@ideasonboard.com>
 <bc508b07-5028-b8e9-b0ac-994c9deca74d@ideasonboard.com>
 <CAMuHMdUD-GsVCyAsNNdK1D-zoDiRAoKgmU+jXE6UT_uCOrc=hA@mail.gmail.com>
Message-ID: <3792527a-4f45-8fe5-1b6a-033cc28fa28c@ideasonboard.com>
Date:   Wed, 23 Jun 2021 15:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUD-GsVCyAsNNdK1D-zoDiRAoKgmU+jXE6UT_uCOrc=hA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/06/2021 14:12, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Wed, Jun 23, 2021 at 11:06 AM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> On 23/06/2021 04:46, Laurent Pinchart wrote:
>>> The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
>>> can operate in either DSI or CSI-2 mode, with up to four data lanes.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
>>>  1 file changed, 118 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>>> new file mode 100644
>>> index 000000000000..7e1b606a65ea
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>>> @@ -0,0 +1,118 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
>>> +
>>> +maintainers:
>>> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> +
>>> +description: |
>>> +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
>>> +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
>>> +  to four data lanes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - renesas,r8a779a0-dsi-csi2-tx # for V3U
>>
>> Only a potential nit ...
>>
>> Is it worth moving the "# for V3U" over a bit to allow for extended
>> compatibles in the future without re-aligning the table?
>>
>> Looks like 37 chars before it currently, it could at least move to
>> position 40.
> 
> Happy predicting the future ;-)
> 
> Did you take into account adding items and/or oneOf, which will
> impact alignment, too?

Maybe it should be way over at 60 chars then ;-)

Not a big issue, I don't mind either way, I'd just indent a little to
try to save when someone adds small updates that then requires a big
table change.


Ps. .. the lottery numbers this week are ...


> Gr{oetje,eeting}s,
> 
>                         Geert
> 
