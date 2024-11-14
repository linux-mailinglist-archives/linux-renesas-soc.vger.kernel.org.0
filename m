Return-Path: <linux-renesas-soc+bounces-10525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C19C92B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 20:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30B08B28551
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 19:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF581A9B3A;
	Thu, 14 Nov 2024 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hc+h5jCQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A981A76C7;
	Thu, 14 Nov 2024 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731614277; cv=none; b=lVr1RZofw/awu4vLbozI+xpcBnwvfoBBa78YrpOSb8vN4oh0UD+vUgbkVm3BKfzywRK89C1ulFeXwQtO76GwOBtUgE0DCysIuoEB7y5inNDKuWJ0TyeWT4f+k2edzmdsS1/RutlsiOLiluoPOiijtmZLWLZlplsmmbHhk2Q1RSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731614277; c=relaxed/simple;
	bh=vmB6hvxyWgBDQfNuZdsI2IQbUBYy8dvD9SF1XBieQSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HANNLpnUq5wpu6F/k5VBoLdWtrwA6CQ8RMatyKO7wPeBkB0PgTchoT309yhEJ3wsHZ9AQAVG3SQoQ8hooaJylw3F1e4prcmse1q06OvG8ukVYt2O34hx5AcRqrZlTPtizwRz07G7bYSrlLZp0G4Tw+nzI65QKFjzyhDjEp4zhJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hc+h5jCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B5FC4CECD;
	Thu, 14 Nov 2024 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731614277;
	bh=vmB6hvxyWgBDQfNuZdsI2IQbUBYy8dvD9SF1XBieQSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hc+h5jCQx4O7/mnaqkoIZOrK1hGYhJX5mx7LaA2RpMOxcAV+paooz6g6ykYGjR5dc
	 BE/3wbQ30ywPGcM1BDObyRR5j5BVQpO98bWAkun/av5+v+3qFz5k7tZJeYlfq8/sT/
	 LMBuj1NF/quicl/DAhutSakXo82UfGZ0PqgErcz4H6M6oo8IH5zuBoQDw3eAhZENKm
	 nlaz24lOD9o//LhKcIkWyeIAcqtvImotC5dDvTm3VMv10RNoiDNsawlQyxcEsrUlq7
	 gTUoF8bjDEdhY8CLiDU3dd3vTK9VJho4t8p4DhpW23jFMiO0tJoTvfCQmgOKk/CAyz
	 THhx1zqD07QEQ==
Date: Thu, 14 Nov 2024 19:57:52 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,ether: Drop
 undocumented "micrel,led-mode"
Message-ID: <20241114-same-hydrated-fa006e6d2991@spud>
References: <20241113225742.1784723-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iAK1enMsNU2XmYYa"
Content-Disposition: inline
In-Reply-To: <20241113225742.1784723-2-robh@kernel.org>


--iAK1enMsNU2XmYYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2024 at 04:57:42PM -0600, Rob Herring (Arm) wrote:
> "micrel,led-mode" is not yet documented by a schema. It's irrelevant to
> the example, so just drop it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iAK1enMsNU2XmYYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZWQAAKCRB4tDGHoIJi
0iTnAQCzKORcNjYixRmpzMut3cWD8oS8TjyrULKpc6GlS9vLbgEAkzWT6aKWyW5P
ArHiO7xD4VWE9Hmgf+A5p8G5rwTuawA=
=AMjb
-----END PGP SIGNATURE-----

--iAK1enMsNU2XmYYa--

