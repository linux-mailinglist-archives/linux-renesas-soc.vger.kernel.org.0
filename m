Return-Path: <linux-renesas-soc+bounces-21505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D61B45BD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 17:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7B5188EBB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 15:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F94309EFE;
	Fri,  5 Sep 2025 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+mNAYlk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C0309EF7;
	Fri,  5 Sep 2025 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084576; cv=none; b=tiXbYq5iO4GOQmWQnwIN+oLOCzGiyu6r01LQB/wQFsQoB6vUCDKHh+YfhVuHBcNNigbzOSFWiYVoBrBaqx5+FiSieVyMesyggZZ0vdMdfCbnc1Pv2Z5UYr+WvjtS4N06frj0QcR56S+Cr+KFpC1j9jSA4SBqW2+4VhctpiJUSQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084576; c=relaxed/simple;
	bh=tnO+F3IBSVwbXYSjQVLWxzL1kIaYxg8U7ngesJvaIDo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eNNk3lzk0pguq0cqcXdRG7/JSBDTzSVHodFg+0whwhJEz4FS6T4sOxnSh1uOnbqrsRbg9Kj5oE6jLArHgNpItzcEoMZJLvGzvkmN+oVYjYvXDfHjB29u47IW0dzO5aPqRv+tNqqkyDs4hlDoGtQ5Hkc6BTEgohHaEH8DvXIZSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+mNAYlk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175D3C4CEF1;
	Fri,  5 Sep 2025 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084576;
	bh=tnO+F3IBSVwbXYSjQVLWxzL1kIaYxg8U7ngesJvaIDo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=F+mNAYlkWXMpVAsqml7L1PUzsImzpvQibt4omaA7EELO8S45YVPMZvPTG4MSQehsn
	 21OdklACLTZlQwY5sDPmQQIVWsq1FUstjh6GTpBypRkEcDy2TUsn8kzm8CyJn1Mdwg
	 CFC6zL7mngw2jBraxQm61HNczCI3GOFdXZ0Vllo6+18hGGF1I56APKlnfXfAlK5pUc
	 h90EqEHZhErp1OiNhh76+bTkWOI8XY9nz6iiScwYvw4L40cDv1nbCGFMRVujhk2XQa
	 SeLXAeV9yHncuR8am7XUoOAmj6fiqF5I+LDtDIfStqe9KAi3x+QAFTKoUnLpbV8+Sr
	 7iBXOCveUOnsg==
Date: Fri, 05 Sep 2025 10:02:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
Message-Id: <175708447882.930461.18275572084838852328.robh@kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge:
 renesas,dsi-csi2-tx: Allow panel@ subnode


On Thu, 04 Sep 2025 23:01:21 +0200, Marek Vasut wrote:
> This controller can have both bridges and panels connected to it. In
> order to describe panels properly in DT, pull in dsi-controller.yaml
> and disallow only unevaluatedProperties, because the panel node is
> optional. Include example binding with panel.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Drop the dsi0: and dsi1: controller labels
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250904210147.186728-4-marek.vasut+renesas@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


