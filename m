Return-Path: <linux-renesas-soc+bounces-11937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5109A04880
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 18:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD55B166D34
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 17:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A82E1F2C22;
	Tue,  7 Jan 2025 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dZXZV8FC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D018D65E;
	Tue,  7 Jan 2025 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271702; cv=none; b=mNOlVHtdZFQI11mmeZZ98S3mTDtak0g3GMRpzMIrXPOjcdHQ17Fz4sUembFosIbzzTpxwnzx8rFahkpzwtDdtZyKgpHSZxs2n5rf1s4jNwP2ElNipvsjgPGWVB4eNo/CXhQjgVjSPdMAnYu4CSgyaUtcLhBZb9iFw3flyEQXlxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271702; c=relaxed/simple;
	bh=IwmQlZDt/c/ViM0VlGii+rqTlbSEHzq3jdwuJizOcJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnGvb3rjznE9UDae2R5wBX6tSVhVTxq1RXmlKnB7/f+UA8PPJ77oIzmoPhzdLT4q+ENM3492Q0PlDR83DREeUu8KLgqVYb1Pfb/Fj8tnk6rcBD7MLXPBEaDKT5U3CCT3tSzfRR1zScyT8/YEiwrsrcWPAOPEEzE8tEn9R2crQmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dZXZV8FC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BEB121F948;
	Tue,  7 Jan 2025 18:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1736271195;
	bh=YpsA1hCVY3ewqxQ7j406xH50/PlVnUrpfZDhJ2TaT4A=; h=From:To:Subject;
	b=dZXZV8FCflkSbXZf2ez6Y/NLj/wwpNR69lN/ozvq6wc0hHsv7aNHN7bcmznN1fdB1
	 8nR/aEIIP3JLTbzZhig7PZp7yrl0IFr4Zr1/jDq7/s4oA3XAZKIk27q1Yl8knhi4Cm
	 /UyHsYkvK+OMnN01osdNq0nQH6wZLtjMutCoy5r5VyrM6fNWTibTQhWJTC0coHFvM8
	 AMa/AAx+f+KLs2A38kPgagH0qrkgOm+K/deSLLzj1Uhk2rHErYdrWDDkqDkkVSWOH6
	 y/dvfV7H0prkHth0t+jSdD20DJp085U9PyAYfNDEnuYZqi34cJY+/bpQG9CK5LGqW9
	 av41Gza7na4cg==
Date: Tue, 7 Jan 2025 18:33:11 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Justin Chen <justin.chen@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	Tianping Fang <tianping.fang@mediatek.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
Message-ID: <20250107173311.GA72209@francesco-nb>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 07, 2025 at 02:10:13PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # ti,tusb73x0-pci.yaml



