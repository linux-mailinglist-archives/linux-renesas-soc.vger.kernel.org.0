Return-Path: <linux-renesas-soc+bounces-24253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE7C3BBDF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E524639A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FB334166C;
	Thu,  6 Nov 2025 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWRTaCdo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0932C938;
	Thu,  6 Nov 2025 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438788; cv=none; b=iRKFI1s7AmPjaVEFqb9edlgVLDHAghgJmcgetrj3z0ivi6bO5rJb/YabD+EyzjYZ1pKgkHOeuohI+W+ZTL5Td8Qm8byTsDZa47ubBJldnyneAPK2e87q3AkcaH2DB5drQ/GlC3L1fWVU0c/A0XKNjZYBhYDIsfxLIDyQRr/gb48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438788; c=relaxed/simple;
	bh=6/ZGdnzJaXeG4LJH21ap7huLV2905EhUDReKUZnFLL8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ulX88GnH1oTU/7ycQHOACI2CGn//2bIysfoQ430NuEQSdbLJm4Wq0fHXPt761xdlaXNM1FbFyOZl+4iFLfJKZlwC3UIYZKU0daOrmDTW9wurKS7Uz3tTDXO0nBPSaP7c5XjZLfhVC7xN3hbMseNQIU1wrCDkHRjdgeM9yExr0Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWRTaCdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6942BC4CEFB;
	Thu,  6 Nov 2025 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762438787;
	bh=6/ZGdnzJaXeG4LJH21ap7huLV2905EhUDReKUZnFLL8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OWRTaCdo9THGQ2HFVtNpwa5bZKWlzoNE+zgTGnk/I+k7KTX6/1uqXBBTL0oqemgnt
	 YTWIuhYdthPpYXIB1J6GLaNgcL81CbylGJwF2iYwyZXaRk3X/RRzmcQcQpKNHuehTO
	 d7VnIO3sCONwKmRHaqinVhEZIPuMspz3lX7YKleF3yjw2BNoVBJA4lVQ+myqkGj3yR
	 80wf3OMQOWEyDCZ7hjBqGf0jipZeva4Aete0X+TleatgeCW99wHtaRuIZ0VTWu6uoL
	 d/I57WwPsDmmwckSeRTB3Sh47AbGkYf87Z7MKudrSjc0OciWT8LQaGQka4QpkQ91Ba
	 ziD+FQHH9LdLA==
Date: Thu, 06 Nov 2025 08:19:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Richard Cochran <richardcochran@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Paolo Abeni <pabeni@redhat.com>, Paul Barker <paul@pbarker.dev>, 
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 netdev@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Magnus Damm <magnus.damm@gmail.com>
To: Michael Dege <michael.dege@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>
Message-Id: <176243878562.3711967.3338841205330431312.robh@kernel.org>
Subject: Re: [PATCH net-next 03/10] dt-bindings: net:
 renesas,r8a779f0-ether-switch.yaml: add optional property link-pin


On Thu, 06 Nov 2025 13:55:27 +0100, Michael Dege wrote:
> Add optional ether-port property link-pin <empty>
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> ---
>  .../devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:129:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:129:1: found character '\t' that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.example.dts'
Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml:129:1: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1547: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


