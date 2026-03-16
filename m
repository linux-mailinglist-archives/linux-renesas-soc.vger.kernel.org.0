Return-Path: <linux-renesas-soc+bounces-29460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOqrFIa+t2n5UwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:25:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69C2961FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D360A3013853
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05EE372686;
	Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCGWlLv4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5C13559F8;
	Mon, 16 Mar 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649533; cv=none; b=h6quaXZf9doFGDHOA8MiKmiiyDI5khFf+5+WnjzEQI0bk3zIxbAAn6B0z6gyLQ8LD1+rq7A1AKa8fsd7jQBHwLogMgN45i+evTjAIUoxr0GaLRPOVgzn2LnK6NxT4BfF1GtiNHUfWclrIrcpb/nLyBWLyI9c/pb9k99Vv1za9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649533; c=relaxed/simple;
	bh=umt5R5UmuN9/aBRkI9DL5c/zKb/EjZuAcHuaR55PLIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NB0dKPjyNRyUvSL+HaG6T66GmPSgZ44npmxQq7qYoNDcnrZlItRlEqzZtD0e+je3a7Lk5l168ksie6PGlvElO9HNdybBSQ/vLX/yK+RApqmlzo7omxQF9sg3u/2DYriEsvVrGRAFVSCpSpb9U6F6HVqjbGZZKz40hXRStyIx04I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCGWlLv4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23309C19421;
	Mon, 16 Mar 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649533;
	bh=umt5R5UmuN9/aBRkI9DL5c/zKb/EjZuAcHuaR55PLIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCGWlLv4KNRzPbHkdPlSHrxoFHz90z8aj9/QiCSOa53ufgnnmag20piDDZwHxqiu6
	 nKhvDMUi/iY734kL2VpD5f7kCY/vT/1s9j0D9fLbp5mkJbY8mbp2f9QC2aZYghd4BJ
	 paoq6qi1KQNQcZBF0ufrkh6AG3/ECOi52psPW27DHtO0UbN1EPrDg5YD8TC0mkNv+V
	 0TDGKzo23AKSes3lEMakT0xffhLQ5VvIKwGAEKfPqFHhrtscesE9CLMwWPcBl8JUdO
	 LvDmeV1tHQ/NpXZKLxaUeShKwpcsJ9eaN3eEmyxObvIo3nrUbCxa7oGk0DddHjke6z
	 VcJ/xZoxVzPHQ==
Date: Mon, 16 Mar 2026 09:25:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible string
 for RAA228942 and RAA228943
Message-ID: <20260316-intrepid-koala-of-snow-33eceb@quoll>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260316053541.3903-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316053541.3903-2-dawei.liu.jy@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29460-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: CD69C2961FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:35:41PM +0800, Dawei Liu wrote:
> Add compatible strings for the Renesas RAA228942 and RAA228943
> digital dual-output 16-Phase PWM controllers.
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

Please read submitting patches in bindings and process directories.

> ---
>  .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index ae23a0537..53d07c0ce 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -56,6 +56,8 @@ properties:
>        - renesas,raa228228
>        - renesas,raa228244
>        - renesas,raa228246
> +      - renesas,raa228942
> +      - renesas,raa228943

So are they compatible or they are not compatible with anything else,
like driver suggests? That's what commit msg is for as well.

Best regards,
Krzysztof


