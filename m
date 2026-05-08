Return-Path: <linux-renesas-soc+bounces-32306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFvPLt8P/ml6mgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:31:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 184BA4F9780
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA0BA301A1DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADD43F7867;
	Fri,  8 May 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnOAzaiW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF3401A34
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257885; cv=none; b=f/glG7M+X23FSysQEl/oxxg5t7BD9XfBWqU1fBA6aNmoA5uBA5HDbYDPQmQAyC9jcjumjzp0dC2JdFThQb6B3Hhme00+kGEMc1abrUcse9KRHG9zIAJW5BbiB2hnjMTwor78r4A67JPvxxGuX0FNCYWYwDmJzXtA0ahjEL6UZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257885; c=relaxed/simple;
	bh=cnYyvwxEAyQwhgE+CAK7wrp3NPyRmDNXQKBPsfoKOLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNVD7R3MeJNUxWs0KyTIBezrGWb6hpnbFOYfwMAKLYjPMMpryD10iZCdxXLOmDea2c9+CaE3VyiieklffiK10Fwg9mUDtn6Vhto5mlOCY7m9wjnQfgtO8/Q7e7DqlWHwuKgxlMI7sHGcoSYS+5d/wVHna2g+GC29p7js5nVYnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnOAzaiW; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c80167f56cdso852927a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257883; x=1778862683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19AaXry4CqS9DFRXnv8/hptHoDVw4WwhQoankIOrhwU=;
        b=lnOAzaiWr/1Q17a1lLdxkO2M7muV0CXMPNIOdXeppvNQXtZhtLbhNEUZ/HH0dYMQwa
         2SMtrR5TvaNsI4uUPp93QbiCtz3vQXvGKhsvhAwK0mnPBDUdZdld75YuM3x+Rycnau8E
         +aH2Dgd224IraW34blnKLrIPmetQ2KXsUeg2HMS7IZwiQuV03NrOw8sfd970DQ6b5zoa
         zZEoQk8erhQ/yqqNoydIC8/2tSjAQToim77eEzV8GPskgYeN99Aj5daP4Wbn7pZvSx/P
         2S6ykXEkl5f2JB9oOyfPq1vrDPV10S6RAH4QvY2UrEefXCGEkuAJgFYoMrMMqJjWEpml
         xzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257883; x=1778862683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19AaXry4CqS9DFRXnv8/hptHoDVw4WwhQoankIOrhwU=;
        b=bFupahOrhaUl5t5FxVjpamBk2HHkopL3G8CbW663vnSMrlLZ9FNX+u3dc0QdzxvOW4
         UzxvQ8xnChMKNGUzraiKj8wnZFdwipWw3g8a3YRd8UFvlmAAcSZoRSddPBqiNjwTnds2
         67FIPZYTnfTmZ+Ej50Hu+9RhJDNT/1DZcAi64h1WA1FZ4oG69xMuQvkSqtH6OmnAvkCX
         RGhrm1BwuNj8nLMEx3fqdkeN4mbLSxaqb1YWet8tVIG2R3yuEdQ/4On5Gm0UE8pyXRwT
         X708LpuJHvBShJdCarsL3da2ibVvzWCrRl9s9i52b9PILenk0jHpnmHHMbJk/vNhqrSK
         KhZg==
X-Gm-Message-State: AOJu0Yx6V29Hm6jKq5kAvYDChbG+aFbHs1+hrm3uoRtZOUGRqA/II1sL
	fYwFZmHB16ai9RMKokAIiIt/xe3OoptOBw1id2OvxzIc3gxi+g9TSCbK
X-Gm-Gg: Acq92OE51M5PIWWWdHBdgv8b3II8QVyaCKpmdvp7tySSQ29Q1lqBvDll1LP+UmGvBj/
	I7KS3vtCbC5RRZH52zAmwKoyBSMah3R55/t/lr3yMJvBjpC/oomnVjeE2Zp1ofAkwBESihTXklL
	4pSb17MlgN8opRwAm7AvFPNTf5FObq+j/uOqG9B7Mu10+CNdkmnzEnrKYpYu2pceoYO+6bHqjnf
	CK9nyNz0NQISd2fF/FZl/N8gtlL4pUWJhUF3eAs+/HMTR4nyj/y3Rn1SUW2oGwvMSeVlFj+Z/gP
	K+z1YUmWPc9cTmdhKAmqOXAe6haXW47I1qNNz945q4rilKgR7b5JbTRMlfINEve4mrHDLVGUCOK
	n5iGQpECJIPW3jS3839sKVKx4yxNQdbcklFF/WBtt6Urbj5G97jvbUWrd0PaDYF8S9iza+5/G+g
	96sy8rBX36p0GZJ70tp3cV/LwbhrgUnK8iEHlr
X-Received: by 2002:a17:903:3bcc:b0:2ba:4e84:976 with SMTP id d9443c01a7336-2ba78f45b67mr133077925ad.13.1778257883273;
        Fri, 08 May 2026 09:31:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e8eef3sm26769985ad.65.2026.05.08.09.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:31:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 8 May 2026 09:31:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 3/4] watchdog: rzn1: remove now obsolete interrupt
 support
Message-ID: <6958a9c5-8ba7-49a1-bd49-1dc6e2f7b9f0@roeck-us.net>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-4-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 184BA4F9780
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32306-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:24:08PM +0200, Wolfram Sang wrote:
> Previously, it was overlooked that the watchdog could reset the system
> directly. So, a workaround using the interrupt which called
> emergency_restart() was implemented. We now configure the controller
> when booting properly to allow watchdog resets directly. Thus, remove
> the interrupt workaround.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

I don't think Sashiko's concern is warranted. Applied.

Thanks,
Guenter

