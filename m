Return-Path: <linux-renesas-soc+bounces-23885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B16DC1CFA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 20:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2E9564BAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 19:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597E935581B;
	Wed, 29 Oct 2025 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aFIAOlpX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D17170A11;
	Wed, 29 Oct 2025 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761765269; cv=none; b=ddsYTCFyjlulxO6jfOwnAYy9BA0bSlcvJBbVuFId5095/dIxkEjJn88RuTDuMTqihA6SiOpCJhm6j4dqf2UUnJ6Tq3xS/ptznWMmPhIrRtFF8Xz2I6d8NXU9YDVifH20RugOIg4qiky+1qrhh28DPkBIRe+x7ezxKeJSG75RrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761765269; c=relaxed/simple;
	bh=YSAtLKSgugrUCDfV6t8Ew+QcO62w47XNzZsHwYjEqrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZcc3mdfHX2sNF5k/fpCCrTJ9FcrWvEr6LxnY4yregYb0pXr7V40ySyC7MY1l8kMu1Gsyn5rPipRDccFY3b5RoX19WWa0+XXBJnzQqtiENzDFwdbBSZeD5TVl218fFraVdvLbtSdxGQtOpDjasVfaeJTo2ZEKRGK/TDNHtbX0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aFIAOlpX; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cxcPC0SYXz9tg4;
	Wed, 29 Oct 2025 20:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761765263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgSFXoYn7Em32WFW3BVTgANJxXcye8GHIxyESfWI5hw=;
	b=aFIAOlpXWVzZvmwCDnAJwdHLbLI/iwfSecCLYMLrRzv1QCogyGxlBtSdxnGoz3Bl+zctc8
	JkW9URo10GuawTV2n5o4LfCbKbp0S6rWQyAEay6qeWQoOJpxt2bCCEd0HGT0rfL7pe8Iw5
	+jKKY/f+NRv1j1yUilYA/+8zBTk8xx98GIZm/V3xa7//EWFIVjMLAEq4rSaDmAK/Pwcl5Q
	S4eMVpceS2UsM9XS41nLoI0H6q3gu8PIlRs6u9K2NT56LVQvPSexKu6lLtG6JoS4tyuZ4x
	UsN100MNFEhhvpsEvEJJahB/ZRY6Up7feS4SOsK9CLpxwNdDD8P04APj91yW7A==
Message-ID: <b40f26ca-ef1b-4dc2-b770-4e0d0a39053d@mailbox.org>
Date: Wed, 29 Oct 2025 20:14:17 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: Rob Herring <robh@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
 <2da374d1-7557-4f7e-9160-86945b73731a@ideasonboard.com>
 <14e5da7c-c6ce-4bb6-884b-08629f5a5788@mailbox.org>
 <7a159b09-d957-4d9b-9460-adf62df9a440@mailbox.org>
 <626acab8-46ae-44cf-b9ef-0ac78d0954c9@ideasonboard.com>
 <CAL_JsqKFs=vwYDnRgj3YJ66Y8ktSWOUY-kkUVHFZKa4MBj8-+g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAL_JsqKFs=vwYDnRgj3YJ66Y8ktSWOUY-kkUVHFZKa4MBj8-+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: bdou18kg7zyskcn66r8tigekqcsxofk4
X-MBO-RS-ID: a339a4accc6c9967f19

On 10/29/25 7:44 PM, Rob Herring wrote:

Hello Rob,

> And now a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb:
> panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch']
> is too short
>          from schema $id:
> http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb:
> panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
>          from schema $id:
> http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml

I used dt-schema
d6be03029a35 ("Add yamllint config and fix all errors")

I used linux-next
f9ba12abc528 ("Add linux-next specific files for 20251029")

I get this in a dedicated clean worktree, no error:
$ make dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml 

   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   HOSTCC  scripts/basic/fixdep
...
   HOSTLD  scripts/dtc/dtc
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dts
   DTC [C] 
Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb

I am not seeing the error. Is this invocation correct ?

-- 
Best regards,
Marek Vasut

