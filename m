Return-Path: <linux-renesas-soc+bounces-17143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D5AB8AE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 17:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84691674DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 15:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A002821B185;
	Thu, 15 May 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXFwPzqb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5A92192FD;
	Thu, 15 May 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323310; cv=none; b=Y26vYasJEyXldl4YIXtW4ODY5QmWtdPeyGd2U09kF1BIF36YwoCD65lQiEgpkUJQ9miJjeoB+R9JYV6Uw6tqgzb+QHqmcvATeYaeaeu/hHbgfVmrsVM5jxuadbUPtBQ865gd1HSN0+l3qxbl78JqqCmREPWg6g77OiAs9K2V9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323310; c=relaxed/simple;
	bh=79rKvSYF1iXSgVT4OeDOu1YzpQSZjLujvBNuWjgV4Cc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XlfDaeYps2KDaT6JMQmhgOQehWxptX7F3NPYekmV4Yb9agGquqpvNZ7kXjcfSJhpX0Hn2l/AiOt/WPtT6mlEljeqxmlhEn0qYw5louFrHIOtMhvxz6Pay7SbWSGlUPlAGRUyVhgOJUdDmV6VI1IOFNkcQDKcRiqMXYynNqWtyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXFwPzqb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1B7C4CEE7;
	Thu, 15 May 2025 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747323310;
	bh=79rKvSYF1iXSgVT4OeDOu1YzpQSZjLujvBNuWjgV4Cc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UXFwPzqbqenqFoBz7lq56VC32z9UhGgupTVwkIpzWw+RJh2YW5wFU+bD4n4pAj1Yi
	 OXh7weDV0nCzxxSfw/jUEIOszMHQrF5ytcbLqf4xY/YbImw+dWQqwfq/O9ZIC7m6NJ
	 NUP5bJ0I8FbAahaHGDBjQOFLdwkUXYywk8P+Z3hOwKAvxlfA8EvtT4SY8JYOJ64VRv
	 AsTW94ElBzDRRiLNQ0spdvph139x1+qfRE+djMIeEe+JPJZFid5s1CjKPwhIDmkKB8
	 Oc7elkG/oLZiKJ1czm6ktURkPzlV/Ws+vE11i2OkrAihYotyvPOi7ukx6JoRLtNtNT
	 hN/qa7U2MLM8w==
Date: Thu, 15 May 2025 10:35:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, paul.barker.ct@bp.renesas.com, 
 geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
 thierry.bultel@linatsea.fr
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-2-thierry.bultel.yh@bp.renesas.com>
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
 <20250515141828.43444-2-thierry.bultel.yh@bp.renesas.com>
Message-Id: <174732330847.829507.6367540282698483743.robh@kernel.org>
Subject: Re: [PATCH v9 01/10] dt-bindings: serial: Added secondary clock
 for RZ/T2H RSCI


On Thu, 15 May 2025 16:18:16 +0200, Thierry Bultel wrote:
> At boot, the default clock is the PCLKM core clock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
> 
> Also remove the unneeded serial0 alias from the dts example.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9:
>  - typo in description
>  - named clocks 'operational' and 'bus', and added optional 'sck' clock
>  - uses value of 2nd core clock in example to break the dependency on cpg patch
> ---
>  .../bindings/serial/renesas,rsci.yaml         | 21 +++++++++++--------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/serial/renesas,rsci.example.dts:25:18: fatal error: dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h: No such file or directory
   25 |         #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/serial/renesas,rsci.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1524: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250515141828.43444-2-thierry.bultel.yh@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


