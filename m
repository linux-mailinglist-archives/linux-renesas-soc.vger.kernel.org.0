Return-Path: <linux-renesas-soc+bounces-32916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NGkINUBjD2qWKAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 21:55:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 491875AB9AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 21:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F0C0300797C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 19:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47643E1234;
	Thu, 21 May 2026 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdI6OOrp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D5395AD7;
	Thu, 21 May 2026 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779393340; cv=none; b=XdZGzIXv71VpOpkuP8hXDxAQzZ76zYKJMNwT1Plful/FGPp2KE45/PkE71DkuMR08f0rm3kNlXmwF0ZpkzvgmQP++B/teKN+NIgI0KYa6rtYBN2+RTIhYqNhchzno6PRzqazHIToCRDhE7AAbW2oo02CliN+25NvWCJXLHkdqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779393340; c=relaxed/simple;
	bh=meelOKHExJiwf8dynD+pHxph07bjWntIQSl7UMpCqm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hV3JqQgdNt9ZaljNzt6f1QE83rfaykiHsfi+iNpasH7rlHJlGLvsudHQVsqjLxsNr4oc1zeQvXm0SuqBfRGFSDrxhbvVBAoDyZ8yoFbVefzDejEbamLPbFYu9dQF9t3nmIn6xElJiljJRsHke5OZpN7gmM/a/zKgTwzZgCJxYYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdI6OOrp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDBC1F000E9;
	Thu, 21 May 2026 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779393339;
	bh=meelOKHExJiwf8dynD+pHxph07bjWntIQSl7UMpCqm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PdI6OOrpIL4LgeV5Vo4QOWYf/HBJKgrjF81ZhU+jZby9j7ApcGEerRAgG/SuiYW69
	 RnojvW0ZWjQx27UD7I3EDER8WPvzaqDZgQIdJWMgYW135hQcGeb5awNXe5MizYILY0
	 VL6Z6B+3zy1DvKAOV6cuwFrwIuq12Tu/cmy9FHn7qjjR09MHHrtvbFylMdRmzPhC2U
	 i66GkzIa75R0Y17c0nAQ2Zm1FjsVzoA0VeWX2htLE9xYmmPnVBdq43sKtr9zQnJ0vv
	 VZVW6OE8qHpG4Gzc61uXOC2IEeFbZzMeNI9PsUDXQ3qUdBBXtBf2BDK/Uqz79IphnN
	 acOM/lcssn/Hw==
Date: Thu, 21 May 2026 20:55:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
Message-ID: <20260521-pants-discourse-463c9b3d9491@spud>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-0-dd5700299390@linaro.org>
 <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-1-dd5700299390@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e2cD1x5BYJY6k8mo"
Content-Disposition: inline
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-1-dd5700299390@linaro.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32916-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 491875AB9AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--e2cD1x5BYJY6k8mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--e2cD1x5BYJY6k8mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9jNgAKCRB4tDGHoIJi
0kOTAP9uDgLuQHo/c1M+3xHNQXDDibJiTEVAoM6FFPBUM+RAFAD+IHlM0//Pnhkf
WTeXPlHUfSPbptIRpicFxSEkiYH/4A4=
=szSe
-----END PGP SIGNATURE-----

--e2cD1x5BYJY6k8mo--

