Return-Path: <linux-renesas-soc+bounces-2790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F14854D34
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 16:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C61B1C27744
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415775D756;
	Wed, 14 Feb 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT06jZIY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB25D49E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925529; cv=none; b=Gq9E1XTtiXj26T68H6n6XSRlYkDvFfUxPzfm/POZAk2JarvQv5Z8qgWWHtAIl6CrPk75oVZwthWHxdCc9ZRvT3A9KEAxiS747b4z/5IeFdVmtHOKkuxfJybmcga9HGmjuCBvC8YulFgm7Srk/E0VX4Q0YST5G6nsfdRazP4/GY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925529; c=relaxed/simple;
	bh=7SAydQKsTJ3o+QyRlul5bC6ajBAL3f7BWiD3waLWksk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=riSkD1/uvl3ZmXtgHeSjqfdNtuM/o/Sfi+/CT6iiwM64AMqbPGb7iT57OV0tbaMLWSYV6654Qnj/CZwoXV8LV/tuv/uSkVM4Flsnd3lpLPSExnKo21vqOmqhQLQb/IiT0m3CLwFN33eW+Sc5NCb4OdNR7I2tEfJ8zMkGxyjYZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT06jZIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2BCC43390
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707925528;
	bh=7SAydQKsTJ3o+QyRlul5bC6ajBAL3f7BWiD3waLWksk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fT06jZIYO/p99PkME11q9c5AKfvHrlU0QkkgDJdzsLh3cNKY8lqtXw0pF2u7pRpXH
	 RZ78V53XqTOflgpqeJxI+YMUDWazP98Ip4HvEgc0k9h1OFKgOGCwKltHomwB/Dk1+W
	 9NJdyLS7w7Wurubq2XYkfZ0AuWvSg3MHjDsvGkr+JeVmQUHIfSSVectZ7q+oJNkpGj
	 U9gWMfJ0/25O2RxJKym9CTM9Eb5b4kweNq7AEa5ylIzo9ljXJ8ZbnstVDnQe/P4j/5
	 NNl6MnbMkn36PQqqPHbX+XvrpOUPOyLyFjxtuQHahejpjRr1VHt/vBZEjDWCdpU8MB
	 jmIyqT8LcuPTQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d0d95e8133so69153301fa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 07:45:28 -0800 (PST)
X-Gm-Message-State: AOJu0YyB6rzHnART2Q4L90rok/SDrh1C/MtaDc31CjNbAkK8/L8acqcW
	klATBklN+arCw2ea0Muu54pGCeXX0xrrR01X57MPjLUBix+jyld0F4eFBg5RSiGFppsnsvTh3Nn
	mBsenPBecYZRjzu1MQtB7kl5/Fg==
X-Google-Smtp-Source: AGHT+IFTuUM6NocMNfE/qinsLcnOzlYr4Wcu/kqfy2TKWI788/aYPTKufheubce2/4X0dzOs7lsUeB0rs8UDOshLV0Q=
X-Received: by 2002:a2e:8713:0:b0:2d0:9902:16 with SMTP id m19-20020a2e8713000000b002d099020016mr2259015lji.17.1707925526824;
 Wed, 14 Feb 2024 07:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a351e503ea97fb1af68395843f513925ff1bdf26.1707922460.git.geert+renesas@glider.be>
In-Reply-To: <a351e503ea97fb1af68395843f513925ff1bdf26.1707922460.git.geert+renesas@glider.be>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Feb 2024 15:45:14 +0000
X-Gmail-Original-Message-ID: <CAL_Jsq+2Bfb20VUaoPDq-4=ebzCtm_rc96GYqYA7CykLOJMVMQ@mail.gmail.com>
Message-ID: <CAL_Jsq+2Bfb20VUaoPDq-4=ebzCtm_rc96GYqYA7CykLOJMVMQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: rcar-gen2: Add missing
 #interrupt-cells to DA9063 nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 8:57=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> make dtbs_check W=3D2:
>
>     arch/arm/boot/dts/renesas/r8a7790-lager.dts:444.11-458.5: Warning (in=
terrupt_provider): /i2c-mux4/pmic@58: Missing '#interrupt-cells' in interru=
pt provider
>     ...
>
> Fix this by adding the missing #interrupt-cells properties.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.9.
>
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 1 +
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 1 +
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 1 +
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 1 +
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 1 +
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 1 +
>  arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 1 +
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 1 +
>  8 files changed, 8 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

