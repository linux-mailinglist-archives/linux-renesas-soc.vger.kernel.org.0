Return-Path: <linux-renesas-soc+bounces-32584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD+MCLC/BGoeNgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 20:15:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF5538B6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 20:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F23E31050DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 18:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7198383C65;
	Wed, 13 May 2026 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMK73sck"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43251EF36E;
	Wed, 13 May 2026 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695705; cv=none; b=AMgdG4BaLDfjrBx9NNSUHWFzkEVqdwn/XBRG+oRbP/yFtRVYuEah0nV9aqGzeI1i8evYFJWBaI16TqHfo32laudj2/UKmyjiZbz0zo6r7TsW/AS31quWzmVlciGO/jVM4DvhZvbgSGwzFnv0odYl5VrinzZ0xny7HikFeS8MBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695705; c=relaxed/simple;
	bh=YS9tI/FJzUbTcVo9zqa8Unshh9fYBIaQpudAGAEe0yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b78j7So6rn3cuwyHesuV0fb4PxKS/7i0sPunc/q3myIm71a0oO965SqZcabWMWFNwZNeBMtfSuqR9DoDVPMeO6pM9wq9K6VhVCi53PN7Ak2ngQ91DXCl44QUuFaM5J9XNrs3swLIAjQqGFmHXMpx67hQEaonx5ATWlf1Nb/qutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMK73sck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A82C19425;
	Wed, 13 May 2026 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695705;
	bh=YS9tI/FJzUbTcVo9zqa8Unshh9fYBIaQpudAGAEe0yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMK73sckMLpGHcglSYGKnhDRsFYwHOqpmorYKYMWzTDY5H3qpYlv+T0WHnrjR0dHM
	 zkAf+g5lZCoKT/YReFOwXkwDdwAPCFboZL8ltzgkFI9WLw9Hh7gL3e16Irm+D+oKw2
	 8RbsOmeHIQxrUY3LM6ScZy9QfXSRajHo4zzQ5zSTBhK+1hbJ5NRixAgTtMT8QBDFwd
	 D5a9bVgrwnl2NoVfWzJE2Zi37setH0Ei+qdCGpMBYu95dBhIWql2onBF/RFot+a/Fd
	 cwllWKLCugekiFGeIjn/bruj2JHm25hxhVLXpR6/zSpGLBUXV181UgOS7WLf2ToFVD
	 w/BVhoxRGlIig==
Date: Wed, 13 May 2026 19:08:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Message-ID: <20260513-fifteen-awaken-f6dbf427e713@spud>
References: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
 <20260512-rzg2-sr-boards-v3-1-f033fc96c906@solid-run.com>
 <20260512-roundup-graveyard-08846d29007e@spud>
 <f2fab17b-fd70-4d83-afee-3809badbb748@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggLcnjaulLL88NFe"
Content-Disposition: inline
In-Reply-To: <f2fab17b-fd70-4d83-afee-3809badbb748@solid-run.com>
X-Rspamd-Queue-Id: 66DF5538B6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32584-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,solid-run.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,solid-run.com:email,solid-run.com:url]
X-Rspamd-Action: no action


--ggLcnjaulLL88NFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2026 at 09:00:04AM +0000, Josua Mayer wrote:
> Am 12.05.26 um 19:06 schrieb Conor Dooley:
> > On Tue, May 12, 2026 at 03:00:05PM +0200, Josua Mayer wrote:
> >> Add bindings for various SolidRun boards and System on Module built
> >> around Renesas RZ/G2 family of SoCs:
> >>
> >> - RZ/G2L SoM [1]
> >> - RZ/V2L SoM [2]
> >>   (shares PCB with G2L and has very similar programming model)
> >> - RZ/G2LC SoM [3]
> >> - RZ/G2UL SoM [4]
> >>   (shares PCB with G2LC but programming model differs largely)
> >> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> >> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> >> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> >> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> >> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> >> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> >> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Did I not ack this yesterday?
> You did informally, because I forgot to add the Signed-off .....

Not sure what your signoff has to do with my ack, but
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ggLcnjaulLL88NFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagS+FAAKCRB4tDGHoIJi
0r8gAPoCVf11UZ17ZavnWfX6ccGjFLJeSZqIJo+8bSSyxs+arQD+K0QpPa42a+sd
c5VKYLQpYH3bHhY9Cpt6lZmr3xsILQw=
=WjCd
-----END PGP SIGNATURE-----

--ggLcnjaulLL88NFe--

