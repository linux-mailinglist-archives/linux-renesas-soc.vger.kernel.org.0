Return-Path: <linux-renesas-soc+bounces-14871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB113A71754
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 14:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F15607A2779
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 13:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C8C1E1DE4;
	Wed, 26 Mar 2025 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sct4qx68"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC62A1B2;
	Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742995310; cv=none; b=lqQiOZ1HkfQ6OrXHErq2ryDYojn6RM+/kb7/UlmKP/aje2YH3WVkPE9jqe3l7+k/5nRC9VUFNtdHxtHL81N7IkhENIIqR7D8w4q8fgmGkqiP/1tbIvaJMaLDpZlcFVDAGfclvH8CyVy2BCfIPtSdQ7wxs+2dxyAqwsD2pA1ABZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742995310; c=relaxed/simple;
	bh=hyEYYCNCtYgpShUKbKEPZOrC0YhCaBy/YzCLuOkzVAE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuO4XEMV4vLKU7LDPFJRUtNlAX3PJdYV3uQU/oRxHhIqMjFv1FC6xX1Qy2Gt798BBgHW3kbUeNQJVBCumXzVAmC/nZsUdXB86XAFvXzfR6J9YuHxJ5Vd/ggi1T5XAe3dQKqEImpvIL3EnsW6jVstg2o2hExH7eMQpMqqQMv+uQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sct4qx68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3020C4CEE2;
	Wed, 26 Mar 2025 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742995309;
	bh=hyEYYCNCtYgpShUKbKEPZOrC0YhCaBy/YzCLuOkzVAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sct4qx68nLEfZ/vV+6oyo9kvjPnvx1ZMRz4KFk/+vGVzZ0Tk5695ia4M/T9ZCS9aZ
	 pSp9pygFLJKma/WyQpKQtNyVRap5sIyIZKU5OPaGlnbtG9WAIT77mDCNkqtR0fOQJs
	 /6XyuawavU2+RAGdFMnqqThBFDpDgLbdTfejKfizxRcjRPlE1OMgPB/IsBicLghQG4
	 23KqxCyVavuaqGGTaIEBUB5ppIXZV/IjAC49rg7Q1cTpJjOSD6ARxoU1+VADHpWLg4
	 Vu1+UI6DZtmTIkiL49exxAFvTzMADy0Vo2u4esaXDVxy27w/B4Imq5yVCSJxddsaTq
	 IMrV4UA4ybSjQ==
Date: Wed, 26 Mar 2025 06:21:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v4 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
Message-ID: <20250326062148.152e3daa@kernel.org>
In-Reply-To: <CA+V-a8tBh1Ev-8=0vcmz0XB7iqKzZZ5dKefrZCrY49Je3KTCAg@mail.gmail.com>
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<CA+V-a8tBh1Ev-8=0vcmz0XB7iqKzZZ5dKefrZCrY49Je3KTCAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 12:52:17 +0000 Lad, Prabhakar wrote:
> This patch series has been marked as "Changes Requested" on Patchwork,
> but there were no review comments on the series. If the status was
> marked as "Changes Requested" due to build failures reported by the
> kernel bots, I=E2=80=99d like to clarify that the failure was caused by a
> patch dependency, which has now been merged into net-next [0]. As a
> result, this series should now build successfully on net-next.
>=20
> Please let me know if you would like me to resend the series.

Don't send patches which can't be immediately merged.
You will have to repost, obviously, and after the merge window.

