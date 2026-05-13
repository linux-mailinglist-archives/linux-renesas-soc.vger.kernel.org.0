Return-Path: <linux-renesas-soc+bounces-32605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gmUcLb39BGpFRQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:39:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112E53B8BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39D2F301A702
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0A03A75AE;
	Wed, 13 May 2026 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbeZA5pN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CC4221DB6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711994; cv=none; b=Sc6OUmuOJ1umJBV0DB3KjSwZ5QGk/cJC3J0a6A/8mcZnbJXI1QgbGeDd8LgUGu6XSkWApYI12MsXhO9vnTw3/+hlo9P5DgFKgJgvcnio1LWuyoZjm4rzMiRd7xzi2oQbI53km1QdrReCSGU/sXF+2t+RMjPjQW9+jlMRqxm26vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711994; c=relaxed/simple;
	bh=0VqbTRVEZlpoi5Ld1YnV7oWMDYNnumYR5TrZ6zn2sPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8SlwHSVvvRxJIgvGJoh1uG8sx8Z8mimT7Hsl7xD8sP8hwP7CA9Yp/jiqYA6le0m77qW9/b8ovo4Mr+6W27l+ksS/3vyRpxdOKg/ov5IuVj04U2V2Giz1yxxmomdPs2eEk5jJ/sKTOuURFuBhVk8frVaUZ0dzhlnbUzawxrU0qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbeZA5pN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba0714574fso40512855ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 15:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711993; x=1779316793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miM3jTAggAFQJz2CzbBvHc0aYdt6SXz1ObmRHBqYD2M=;
        b=XbeZA5pNH6IFvMJCizA0sjWapJaKNJH27lSsQWG2InYGMKMUThiey6ZJYqg8cIEVBm
         r0UhW9S02zUKEVHkMH4P3XarBQw0dUFBvfmZ7INC6HwSqiipCGAsyhqND4I8fcr2oskH
         eq9ygmWEDq7l8NrXuWqB4XNmTUnx0PcFt68WAtD7QAzA2htqUjxGlbO+laNAMjCJQDsg
         iAqFlhkWcSV/PvlkLNcy+8dRc0bCACySGPN7zKZn+TCPTqpGNbWdrkbO9eim840oPYY9
         aHh6TEpRu/kCWv+P/xlY+oBniDIsXDOZoFzRnFs6XWFIT45iwLXXQCpF9RvnmAvs7YsD
         Kc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711993; x=1779316793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=miM3jTAggAFQJz2CzbBvHc0aYdt6SXz1ObmRHBqYD2M=;
        b=fKvGCE9H3tDp0NH7VSlvn+Akah5qSIzDzmfN4DLVhVWPhRUFNSvZopK1ofwG5a0AYj
         j5cLOpTKPbqxsbPDt/O2X4YYJHLFHjvmIpIIGpdx1fg/fp4OEJkDQsoVKvB5oYwzMfC2
         hIcbgavV6dM6kV5BC2mxETxPkY1XZHyISI7T9baMNqMznMHykmgfV5nSAENEELV7GYED
         CRKXWbL71RVZ8s8zxA7rxfUSZqSYqlopMUhJRXH8rLAUa8W5e3gCaOgZeTNgB+Kz6hnt
         FFKZbamR892b0H9W5QL/tEkRoNdppW7zWb0Dc92m4Vt9pN+TE7XhLuzc5+86kCfPpBcM
         hc4A==
X-Gm-Message-State: AOJu0Yx9bczUMicqq8psBh1Hz0uD3gzrzNxKKr3pz+vySZPLYItBMexW
	g7VsYV7vme8BWQOhawuxwGBbjdmUJ5SMJy+vIaPGtSAkTIMw1dytkpFM
X-Gm-Gg: Acq92OEiWMSz/BRHMHQvZFtaZ/hzaVZgRss+CIs2GAuh1OLDfMqiFitJ08i7rn+GOaf
	Xjl/xxTNziiSopPD1tZ5E9E+nWeUfplbMVu8CNCRO0qdPn0XrE3J6aXn8smWeXKkkGpAxDyrR1u
	1xRTL6wMhoJ6++J1ua/ercYLsb1FlN3par6IDhM79G4HLgw6o8KF2MB9RNHnt1QqPx2VFz8X492
	XOOI9p2lNor3bOLGWHfLNR+9YnjxQDvegRxAH+NrInr3osyRv0ipJjgrQIVHfTHDyLyjExb6zRX
	4inQv88rh/yn4pba374uWwgkMVyUnuhA9LWNAqV6vetXLuiv8rBRlOr43MoRxd8GPXeBnGhejas
	kcm/hd/fkHKqN7T/swcFDJXRyr3QW88gij48l4kgZosH7s68pxzmeTOXxBhliXn+g7FDjHGOATB
	51q4iTG6bE4ldxeu0vUCWzBG3f4MOpY+owab4B
X-Received: by 2002:a17:903:2f4c:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bd2f4e4c49mr48108145ad.10.1778711992677;
        Wed, 13 May 2026 15:39:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2e7sm2853795ad.5.2026.05.13.15.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:39:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 May 2026 15:39:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: watchdog: renesas,rzn1-wdt:
 interrupts are not required
Message-ID: <c06eaf33-6817-4016-9ff3-600027501445@roeck-us.net>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 1112E53B8BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,linux-watchdog.org,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32605-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:24:09PM +0200, Wolfram Sang wrote:
> It is now understood how the watchdog can do its job without the need of
> an interrupt. So, it is not required anymore but optional.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to my watchdog-next branch.

Thanks,
Guenter

