Return-Path: <linux-renesas-soc+bounces-29167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGAQCOOqsGm/lwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 00:36:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 808442594AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 00:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49793312B7DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 23:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36602E2EEE;
	Tue, 10 Mar 2026 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFkgOqJl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6737417F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773185759; cv=none; b=ag3AZJmCLXlqCzfeRzZ3P6mIHAm48gGlNmZp+YXIR1TPALpvsilJ6B3Z2P5CPQbw76e11XSrRsXalQtPA77W80sGR7GgCNzQYuNwvNcilTJompcZpurSRfK7tZ+PIi583K4Lypaw61feT6RYEh4NIJheaJNu5lARZI34/l80vks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773185759; c=relaxed/simple;
	bh=hP+WJz/jKU6NpzI4xyhs/JtORqAsnUOJ5KWRgrIVvoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrLfjR/Cfeml9t1IuIUNZPycltYdai7x++jpzmtyO+o9UQQ58kVkipyW879Sg8nNb1HU8S7k1RDq7/ujmYaJQD/fwkhI6WLnbP1Jc6ekKOB94Iarn8Lh3s6H3oCRzkDyK/IpPxp2t3jfwWOD64Syh0lqKHcDbWxJaPlH59LhTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFkgOqJl; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128d218c5f6so1085213c88.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 16:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773185757; x=1773790557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxUPjcUmulSXUd9DWxJ7ndVUYnE5TGazkQsXUEMmZVs=;
        b=NFkgOqJlGiPlob9isuinp0sELIC5WGTzdsj3HbE7W0anXTs9Dwpfyc2CD8/AjoWqN2
         dUuXCu8ExdG7U2T1/P78kxv7Or8EXG8b0HRGJuIMGcLya/sRkWtfAC5MKA6JDSqcKSob
         JUwm7qmPdgRkuk7doXxEyYHFI6/wokj6J/40UUvRb3QzPPFEF4B8u7rkQcy/Ifar7oJj
         OjfUs8mDYO0257I0BU4xrxtf8B6EBVbG7lpN4MauwhTgIrqvyYwJaniJcITwZ3xvIiu6
         VzcEOx1PgRrYKDp2eifw7z2COQM57US6SQpnxwvPAugRWNGDMCUeTxGiHFIXFioKPSVX
         F1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773185757; x=1773790557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxUPjcUmulSXUd9DWxJ7ndVUYnE5TGazkQsXUEMmZVs=;
        b=JfJR22i1Y0yEA4kSCwUM5AXmtWIk2ahX4YQu250Q3XxfR+50hnb0bTaLNyyMwQD+kh
         WpV3dbIW97A36lLan2x8jeb2J8Wl9RJ04ouD2VHAPFceyCClOgr8KOwE6L5SlE6tfDoH
         xVBeB/tkBYz5mKsWoKoe9T+95GyIdE5LvEQe8NCooAGFZIA0fcP09Jjvet6QnNz7dio2
         bNClZQkBNzQX/1pPM4tBmgRZrHimjs7Y88rumgb6xcoDiPvIRxDXacIWja7Zk8VIHeMB
         m8Ajpecninl46EI0L33PbUo4/cAuqEsbxtK57cp+hzPA+MFQMDWu1jwS8TgUBfNPE27Q
         OR2A==
X-Forwarded-Encrypted: i=1; AJvYcCWwmQVC11lxPdz1tVwntJNSIEW4ZPrsoBb4Vw8ZyJMdHgB2EZdki6KrWIQKjX9rEOZztq9nOgcrC00x9cmLDDERZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbzu09pIg6O0Njv/Sp1lTQ3Vj310dE+rh1NCq+m4omlCOfkU20
	6icUTXxpAiGRHjP2FBdChUx16p5cJXDRuy2K+4kS8BIG7nxJarcgkr1r
X-Gm-Gg: ATEYQzxGKHEY4ANEnIBcRGF42NWlhwXufoXor6Whyj4aNhpdsPM0pqT7X5yLXpslnAe
	xTNFkPi8572l+nfc8XMmuJEmLjWwvX66AHSFL/ejlI6Zp8lgz8QzMIUKXtzKNDOKzV0ttHR3qhB
	u2opwaby0dWx/RnC3xGR6QjnJpd2ifB0n0Vp2YOHo+JBIx//jnV6PuSDONQpVuUD9PntNTwtAYT
	mjxQuJKoUJzjFlF4KxFpRnPL6qdJlMaB0+juXTG8qSfZLyAbdv8liubvIfXqgGv+I/v/rB7dwap
	FHYBthvUZHieaGJOqfyK+5x0sLSx7BJ5BMmexDKtZbRYfKYlCqXQU8L3YiI+1V50SphREx/LE6m
	ZwJAQKKgtv7rMBCVEJlCw5IOCLel4lK5jeuAwtHzkeTH3mQ4ZZbJtGVRT5OkXeIlhIz4rA4vdma
	MbRvNA0ZIk+9wHOEZ6rxL/fFbbrutNkzi8589yXw9OVDxUnp15rEB5yGIUmtu6fsqI2L35t42RM
	u4=
X-Received: by 2002:a05:7022:6983:b0:128:d375:f1d3 with SMTP id a92af1059eb24-128e77bee00mr299440c88.18.1773185756882;
        Tue, 10 Mar 2026 16:35:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6e17:9d84:ffa0:986b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7cd6aafsm445110c88.14.2026.03.10.16.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:35:56 -0700 (PDT)
Date: Tue, 10 Mar 2026 16:35:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: phucduc.bui@gmail.com
Cc: krzk+dt@kernel.org, geert+renesas@glider.be, krzk@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	hechtb@gmail.com, javier.carrasco@wolfvision.net, jeff@labundy.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com, robh@kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v4 1/2] dt-bindings: input: touchscreen: sitronix,st1232:
 Add wakeup-source
Message-ID: <abCqyU2-iQgcghzy@google.com>
References: <20260309000319.74880-1-phucduc.bui@gmail.com>
 <20260309000319.74880-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309000319.74880-2-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: 808442594AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com,sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-29167-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 07:03:18AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Document the 'wakeup-source' property for Sitronix ST1232 touchscreen
> controllers to allow the device to wake the system from suspend.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied, thank you.

-- 
Dmitry

