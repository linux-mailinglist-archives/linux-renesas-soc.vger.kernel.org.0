Return-Path: <linux-renesas-soc+bounces-30170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNAhJfiSwmkXfAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:34:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF89309824
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE7D30EC237
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74363F99E1;
	Tue, 24 Mar 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pWLLZTTk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C773FAE00
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358861; cv=none; b=c+3+WXb57sjklM+5osN01+sXPzds0UAJp30HTx3L4bSSO7lG6NVU2kZ4H1kJosaa6M0aj0KoXbfegIvV2UrmF9FC1uwIjRB8faZqdBYkcrI7rIuKpZnLUhFEInSjadiW5ZsfzR4jSm9rnu2WQGVzQOF8scrgLkYltvOewR0QVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358861; c=relaxed/simple;
	bh=6HDqrseFiNHGpFIhEj3IBVrOPn39i0MdkU5Gpd0ZaKA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TbkTXJ4JPHfU1QsmZVkAzDqtkLFfk/4CRN6dKTd5Uz4LFTs40+BJagG01maPowYgfyvMyLpYfQ/VjAEBQGItw7Ykkdi0dPoQZSAUYOe/+jKzynqbzdYc0+CjDG1V9UoiOnS2uzjk2sXR1dGlEjirPWtvbHfW7dClpDZdw2Tk0xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pWLLZTTk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8F53741;
	Tue, 24 Mar 2026 14:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774358778;
	bh=6HDqrseFiNHGpFIhEj3IBVrOPn39i0MdkU5Gpd0ZaKA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pWLLZTTk5w0sP5XLZX8uj8d7+p3fYwKe8HG0b2T90kFPS5xdzOVlPkcv/m8dDFtlT
	 joI+yUlShduO1OCtu2N/xWfk6DxzyjqRjVMMbhVIPI+usMY0iu1zRgif5rD67cJQXg
	 aTVtPGYIS/8Z+FDHb613SgPqWYx8Jybsi9yMvmjs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260317200413.433722-3-laurent.pinchart@ideasonboard.com>
References: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com> <20260317200413.433722-3-laurent.pinchart@ideasonboard.com>
Subject: Re: [vsp-tests] [PATCH 2/2] vsp-lib: Support newer versions of ImageMagick
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Tue, 24 Mar 2026 13:27:33 +0000
Message-ID: <177435885350.3380983.15856132991742292610@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-30170-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ping.linuxembedded.co.uk:mid]
X-Rspamd-Queue-Id: CFF89309824
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Laurent Pinchart (2026-03-17 20:04:13)
> The ImageMagick compare tool has changed the output format of the
> absolute error metric. It now prints, in addition to the absolute error,
> the error divided by the number of pixels. This causes failures in the
> output parsing code. Fix it.
>=20
> A careful reader could notice that the script divides the absolute error
> by the number of pixels, essentially duplicating the calculation done by
> ImageMagick. We could instead use the scaled value output by the compare
> tool, but we would lose support for older versions of ImageMagick.
>=20


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 2cabb9b96cde..c8f21c60741c 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -264,7 +264,7 @@ compare_frame_fuzzy() {
>         raw2rgbpnm -f $fmt -s $size $img_a $ppm_a > /dev/null
>         raw2rgbpnm -f $fmt -s $size $img_b $ppm_b > /dev/null
> =20
> -       local ae=3D$(compare -metric ae $ppm_a $ppm_b /dev/null 2>&1)
> +       local ae=3D$(compare -metric ae $ppm_a $ppm_b /dev/null 2>&1 | se=
d 's/ (.*//')
>         local mae=3D$(compare -metric mae $ppm_a $ppm_b /dev/null 2>&1 | =
sed 's/.*(\(.*\))/\1/')
> =20
>         rm $ppm_a
> --=20
> Regards,
>=20
> Laurent Pinchart
>

