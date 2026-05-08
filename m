Return-Path: <linux-renesas-soc+bounces-32305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNkgAZwP/mm2mQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:30:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1FB4F9770
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2135D3018BDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 16:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8872BE7DC;
	Fri,  8 May 2026 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGd6ujop"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA126F2B0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257817; cv=none; b=m84wBy+Lt3hz49wxjDWmsHcl8KE5eNnwHjUpT4LKjUWZOJD1LaoYlwqneypWUfsC/00PNhFrk8t+nXGHWh05v3j18wMxcP/6EQdduGYt+B/pJZGEFz5AblseDY1zNHTAghHE9KPXj+cWQIjNtGlAayWLQbr1X0OIJFlkL6sYiVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257817; c=relaxed/simple;
	bh=1WKhoWxPhpK3PawgeH4oavep5aWEmXj226jcjx+MT2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGLhgmSsyV+PbxD9zPZvnocfV2HQP5JfFcoOpJu49XIce+KEhFMgdM/vChiZJPX11y9zC1kYZPqo0HEhkaas7olWCF8NfXOtc0LT+SqZsJw1O8CnKUQYDVsdpJNXkljhUVgWku97JfR2JYAxDvM+z7lZM1fZ4PzyY5dD+g340lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGd6ujop; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba6485d219so14975745ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257816; x=1778862616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hj8kaOVOLrv8kZO34jyZlQq86fjxrE1HGxSP8aPpbJ4=;
        b=eGd6ujopHp8pONaAnEiFdm+kmgTioPHmNcHq7q7XIi1CB4ilM1T2695nU9Fxi0SqHF
         Yzrwz5ElDbxdWTNKz/AP1+YG7tf5dGCYVLSb1ntGxdlBqfIl9mapn+fHcajhk9KQHEVn
         93cwGJ5sZps7ndlg2iW5JnJfrjyNRGTOfv7gEcU0tYBjatilKITVZlzUg1lUe06viXoB
         OLybqTuZLG2vz8NSKWfAfl48rOZizUy1LgwRxYXW8o9koAtSunHHCvKkszO8qvcdzWLX
         N3zoii8NlaaVMi74+bPXoxMcmDG8gAUYLFa6mRiugWGojzKGoPRRG+hQfL6ZQ9F+5WLy
         W+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257816; x=1778862616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hj8kaOVOLrv8kZO34jyZlQq86fjxrE1HGxSP8aPpbJ4=;
        b=Qtjsv5lgsAJp/jN/2TkGt2nTjiivlElsGcl1NqJ5R2EeQ940flwBRnDJ3SNPbbGUt1
         8qBVBXMYtM7dEbky9pRJKpLC+0NTrVDDsm6sXi0n6xrUp0b30jBiGZS5jlccRsdhCjHI
         GgkS+mLpwdUwOkLG5mZiIp1R2ausJp4GZnUT1KTItp2wULT9RTUGySSZGUtBRLhVasJh
         sU+wf5gbyj9Jl6kOYk6pmkIromg7smcYqAgJTFyWLIfeFhaz3Veh+3pm9nG9OkpBP3ER
         LTmZgrLbLyzjjVsC/UdE4xxRwb/olRtHnha5ef5q1K92wO2mcAmOmqlj5BzyfWO8dHm/
         7umw==
X-Gm-Message-State: AOJu0YwcFrrVPvtQ3jfQVjDqYk5b3eIsrTIUjqlU8KpRdRis/uaLTyJj
	8rBKfQLXvMF0hmRxl6+XJ/nXx8r/rcTmI81FMj5IlS13ERw/6nj6YWPH
X-Gm-Gg: Acq92OFnJH7cGjBUn3pvHgDrdlQhqV2Y73qzZLFrzjjDood05zIo/OgPcRCx5Tkvyke
	mp7BsklcahqJqdCdIcE5CSHHqq2UKMvxXVXykotAIF5ZMWT1oy+rMHyp2D8Zvw58bswLpJtV4In
	i0dxaEufU9R21ix11LeLLXxRTYPXSltY3d/QjWpm6cRi1LlTHRglb5h/PwPc7+OvWi+BJAMsq2l
	kvfDBZGae8jtUiySLSpRvsS1Da7Hkb7kCwvgnGOdKsGY3vj3B6TN6kxDwsf94iWYDSoophehZ22
	J0b6zTw+K+p/erEqkIk3dEIqYdMPYypKnM4mH6YGsSykeUidKQBi2NPuLGXhwyAk8dVWT5VmQfq
	RnEnVcpYoi11MqoC+W527+XE1iKoPDUHt2sxzsu5C29dCdGJTi+Zy0UdW+vWSpXuVfUBvvcJ8H7
	6asZbp0IMSlHQRlKZahkcjrLIgPju+babVYXIAcdibJpv5jtc=
X-Received: by 2002:a17:902:cf4c:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2ba78f4e986mr127615525ad.7.1778257815659;
        Fri, 08 May 2026 09:30:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40434sm27896365ad.29.2026.05.08.09.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:30:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 8 May 2026 09:30:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 2/4] watchdog: rzn1: Use dev_err_probe()
Message-ID: <65d037e6-06f3-4f20-94f5-4fc1e21f76bd@roeck-us.net>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-3-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 5B1FB4F9770
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32305-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,roeck-us.net:mid,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:24:07PM +0200, Wolfram Sang wrote:
> From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
> 
> In the probe() function the following pattern is present several times:
> 	if (err) {
> 		dev_err(dev, ...);
> 		return err;
> 	}
> 
> Replace them by dev_err_probe() calls.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

