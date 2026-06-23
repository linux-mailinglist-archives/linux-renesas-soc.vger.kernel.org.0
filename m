Return-Path: <linux-renesas-soc+bounces-34365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l/F2MF5AOmpK4wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:14:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517026B531D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 10:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i22zbFRS;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19D603002B50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 08:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF1C3CBE7A;
	Tue, 23 Jun 2026 08:13:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE93CB8FF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 08:13:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202403; cv=none; b=tTYYga+OIpA0WvfVt4uplmPolI80CTGshEZVSTq3E7RGIGXtlARQk/9Ggwj/CRjQXRyTKEvoOMp8C8f8wdjPFbV6DobiudyiJXr/urtMI6jZHOKRAo6ZiV72QOOOkCp+chqiOrqwd4zG2E9IYgMY7cYi9KQwEBX9kQRuny1PUUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202403; c=relaxed/simple;
	bh=P3zkQ6XgzYgXsHEgx6qPcSJ5cAhQqGRNFMvwsdKupso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj7P+cREIqPFZTkOyNCpxTEfDy8ANzMlr0aK2JFm5YB+5ZJuSyvQ4r1fLA+tARHwvZUFmGJsUqC5l1NKHn5li4R1ykuUr7UAJ7PVXMMxCHWVser4NC3iI0UMOnMqqzIiOzRXKpWZ6l3YzBC6tXBrAXJdWziwfjSqmBNCDoqGsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i22zbFRS; arc=none smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c0c41ff84a6so435368966b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782202401; x=1782807201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TIRRzOP5f40W2P6qE1IkeX7ZWgsBW+lVzgic3aztgQ=;
        b=i22zbFRSMinIKPpuirPi7VtkkK/YWHu2wKZ+3LfqeTQcjvKaBzvHWCGNqkt9suuR4p
         XjGi9OAyJbl+XyBpK7ttMW9d8RJ9LbC16684e10dSCebfj16ULGca7RuGplIJ/TS94Zb
         YNuyqL2ju/Z3fudyTq+M5sW6LfRvR4R63E8p+NP0RVsaQErBCoZcJ8evJ2raTCmfx0N4
         2trMDSkl4g9LHS2gcyVzMOOmfxibxy5fSzdbyCuT6ggTHwKmKsYZHwm6A6OiMNTvPN+U
         VkV7d8362IYGLq7PM7TFmQ0y+2QnRJXlkJ3Twk/lGyGg741iy9Q8dGw3OAVm2IlTfTOw
         Z+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202401; x=1782807201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TIRRzOP5f40W2P6qE1IkeX7ZWgsBW+lVzgic3aztgQ=;
        b=DmktOVnJ0u/0L35FAecJXhqa9hjMvMfRbbhEQZC3RssFCv64Pk/QXOoGdJ+e6PpZN8
         qpx1jaeR2TH81FAWvG7IuttZSTXOkkRV9qpeemfZKz0Nfjy6MRaqGPWSPeQEyh4hikhZ
         K/hO6UNg9Ne/f7ulJ0Q16gtgYmGN4PLyux7sAZ4XdxH8H0FuuywxLSg12PF6py3MKuz/
         yXc6fcBD9UVMTV6E2Ly+MGBnDNEBOi0TBRRHv4qAwizr3hdWR8CmuAXw6zM+9QfPkdr5
         qZfg7ubLzWef1i8ejOwaO1v3xUa+BfJQYCsObkGgc0y0Dyc+vV1BPmcneZgRSC/dVP7f
         Dd7g==
X-Forwarded-Encrypted: i=1; AFNElJ8dXm4xavpUjqsNZLWTOLmkQg9x0+rJI4SP/rULw4E/fvKT6OeFuFhZZhTv/mYXfroh+16gcXgVIw+pnNcAkYtuWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoOtdSZ+VIsbTVFyEK8W/y4ExH4FijCLeGT4xdGFBmTFKzeRm
	s2pq+VUX72ouTKfxdh0nmjsGuV+FMNHtm41UesdksqeLdtb/buKaMjr5
X-Gm-Gg: AfdE7clIXWkiRNnqXOto/EtufT7hHMoVaf35ECsjuwcOT2cOk4CyxHTMfC3Hbrqnj7l
	DhGTuPEp4nrvQb9kzOA02nFvurv0m/DpyBesHeEDIxGaNDmNUGi8g24+lzUJ9JVuBsaRRR4x2fm
	0BsRt9NpCwjlx1bJBMZrWhRQo2vQAbDz4ml4Tg9+3jfvVmwEtjgsxtWOiqnceqQEfcK+gwsyqPQ
	VPBkGx4SR0bFIT2SrhzaLt8WwsoB2iVzL34FCo5RcXfBB38ptO6LJzYFi9nSR1SKvCyso6Dm8nL
	AQAAywBK+UpZsucUro2iH/uSX2C2uhQWukUTzOlPVA91HvQs2WbAPYVfJBAC4FnuiL/qGGxzcPD
	wDkPi0HHQT/GED+pugKPqZWG2pPbORsoxXW+ulXHuXnui4mNv78+ke3fs4TpSM+wuU9LVrTpE6N
	RbOeZM6qOD
X-Received: by 2002:a17:907:78e:b0:bb8:b593:edba with SMTP id a640c23a62f3a-c097ccc02eemr928113566b.38.1782202400801;
        Tue, 23 Jun 2026 01:13:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e12f6sm487614366b.47.2026.06.23.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:13:19 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:13:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <ajpAHMPdR3ty-N-n@stanley.mountain>
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
 <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34365-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:niklas.soderlund+renesas@ragnatech.se,m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:andrzej.p@collabora.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 517026B531D

Yeah, thanks Geert.  You're right.  I'll resend.

regards,
dan carpenter


