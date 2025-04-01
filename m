Return-Path: <linux-renesas-soc+bounces-15244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98523A77D11
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 16:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70213AF12E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A874E204684;
	Tue,  1 Apr 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyr3ujcW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F52046B4;
	Tue,  1 Apr 2025 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516020; cv=none; b=Ykga/aGuvjP/5LroynKEwM61Ilxl8AGrzGX6iLGWgRRBSvqiKEKU/+cfNUsQ+QgOI68dgvPcqwGeykrtG+4Iw5o7ApdfUsqwitFKzXZXP+THJbnRnoG0dclXJSopCw8NoDMOIOMqfxdzd8xkwKUYmhTJNxd2k4sHkZX7Iv+zKTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516020; c=relaxed/simple;
	bh=og3p9HZYxTL6/bsdpwezmV/vVG5W2Xjv9xzDd7pmuRk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ll/TAJLCKYV/02ty6S0X07kWNHe7h3Xfteu+vqD1rcTvu5MgnPL0KpkpY2lpLQjCug+z0iGxFSOmHDb9g10fHcdW7AZN+jJw2zPca5jUwUd4JUcu9JJQVw9yfachjuCgiSy0Vw7FlCtF7DKkufKdUstjUu6APbL+o49d11AIXVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyr3ujcW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBDEC4CEE4;
	Tue,  1 Apr 2025 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743516018;
	bh=og3p9HZYxTL6/bsdpwezmV/vVG5W2Xjv9xzDd7pmuRk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uyr3ujcWlLWiWurappfwocLuldPM+LOjgDv10yMoZ6QIZ4noinwei7qyUugP4fBHn
	 rVHwVGFKYNWEFrOzsfPdxCOv46+PTTP1EsDEvl+Sb2IdWQJ1uccV+92Yili6lXCxgE
	 jLQwd1ggtGMV+QbKbToLwKkENpqHUS6T/uViDBIUzq/gQT/5XZ5Q+q1pIDP5T8j/Ba
	 dRTPv/c7LgUvGMku7TroLanJcnYbsZJhJ4Q8OqjIgVoMjIzpskBQID1yUpUTPccXQn
	 Va2ysCzlYAeoEYHvkwajz57o8Mtqjb56nq9eNGRPM1AWV1KVCH1zYTSnwWMh6uKLQO
	 t6TdN6owF/9Xw==
Date: Tue, 01 Apr 2025 09:00:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250401100837.29792-2-wsa+renesas@sang-engineering.com>
References: <20250401100837.29792-2-wsa+renesas@sang-engineering.com>
Message-Id: <174351601673.3283654.13923027888464994082.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D


On Tue, 01 Apr 2025 12:08:37 +0200, Wolfram Sang wrote:
> This instance has a wakeup irq defined. It is currently not used by the
> driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/mmc/arasan,sdhci.yaml | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml: properties:interrupt-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const': 'int'}, {'const': 'wkup'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250401100837.29792-2-wsa+renesas@sang-engineering.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


