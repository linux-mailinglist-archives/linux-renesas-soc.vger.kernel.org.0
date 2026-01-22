Return-Path: <linux-renesas-soc+bounces-27314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id esbYLFmucmmyogAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 00:10:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC0E6E679
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 00:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC74130056DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 23:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9062D3A5C18;
	Thu, 22 Jan 2026 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZPZ95LVR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvGOr2E2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0438E5DA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 23:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769123413; cv=none; b=RWpT0u1T9GTEtnOZzKnOKRz8DhfiNLJ6jYqNGD4WJIYQ1P2msud7BLWJSDo65VH8TLZCXzR2yF5vHa2R0jMUsXQVBGTsBf1Fwbs+fl6yRzul6j1vFWRP2IyFwXYRbmrZVn0orLRauomx9XUmmnXitKjB42mlX25sUvlr50Q1IUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769123413; c=relaxed/simple;
	bh=fxohier5lUCoNZjoQbvnb3NzZlRru4fGqVGzs90dAQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1U2yOtcJCKSBJuMNWx+3PxrMdUBzE6XHhA3ABCsI5vaK/pmu8brUdZ3/eUUlDnbxxOAZA4iXoOJczo2KNdyUnAevhekqW/LQLgAgAZ/qx5d9SYQ+a9KSrs19F3RwRKbSx2xeHnqDAa8HxVezvfaZKy0XjJL6w8YXvCUviVfoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZPZ95LVR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvGOr2E2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769123400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BavDbeHbJ9VOae385eqgl0K+amHNnSgI2QP9OyRUoZY=;
	b=ZPZ95LVRwvWfxt+3O1hH3fYe7RgTXhRJzXXYYHjqSsPh6hzkTFBCt+WCbW2/G982/1jDuj
	K0gRHCcxyqAxoHVJzebsN7D7h9gcdFNcRGrCFjAHdgub6MZIoHsZH5U++nYrXV34QUuc1+
	6Nhvohhy4xx5CqW6vOaSAZNtfZI0Gg0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-SwqMoqfiNQuuzouPyDKGFw-1; Thu, 22 Jan 2026 18:09:59 -0500
X-MC-Unique: SwqMoqfiNQuuzouPyDKGFw-1
X-Mimecast-MFC-AGG-ID: SwqMoqfiNQuuzouPyDKGFw_1769123399
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89493622b50so607896d6.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769123399; x=1769728199; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BavDbeHbJ9VOae385eqgl0K+amHNnSgI2QP9OyRUoZY=;
        b=NvGOr2E2SIFu3LxPDn97KwHtB94phBd+LJXGE+TqJJqp6vAwknrZVmHpr02x10PyUB
         aAqlw9Q/PkLYX54TJExaDAWZB0GhiqnQcMKaJS9EaYtz5JRmmSgKZCK2DYb6mPQ7dLbF
         KSdNhgFJxvuK475fGeN5+WdNVX8/ltqoX9W4DYwI/BG8fj0CrVqGvmS6KIE38u0WO+9q
         dYygYQEKwiIJzdS4l/0+jlQ9fpKBZk5OnfKhCG9VUmg5v54MvLH3OKIUdiXCHwLcK+nt
         lAL4KQfpKiTyevqdonYukgEJUTHpqiGUMLsAmRzSXMhu1LCngW3k7wRa1VlI4wCU3uc7
         3Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769123399; x=1769728199;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BavDbeHbJ9VOae385eqgl0K+amHNnSgI2QP9OyRUoZY=;
        b=icz5/MWFYjXgqX5j7B8PT/RnBJmG8I/CJHllsK1hL4xQFYM2lWsMHXO8fvmCerIxa9
         GFmPywEe83/2GlGdR3aTDdr559HsEss1tyTQcwN+t4pUTHMNW2c6IaCTY3peBeo8ayOb
         o/jrVLfrCub7iuS7B0StOY+6URWvLMuzC5lXPodMjGj1LcyZ2bPqsEkq0R1OiB/t5ZbU
         vl3qRm/FWUhpTxZQjNYpMI+P2+ihfKUlmQzqXsVfkprBF6Ozmpx8o6qiM4ENAm0myfCv
         ff3vUDSzCvMKHh1yGuJglnjN99/9/gvYQHgxfSzEHprJwbAcgYRT5lyibBwH1vFSYLyI
         js2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFv8Dd5hdtKgE1401xYOZV8t3jneguaClUMhX+xsMP4PeIYyQyB4bMlwKRyt0i9rI/vQ0E6bwObujezJQ5Va3Mxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SAgjDPte+HlfiMLGFLDdpzCM++z8SevKzEuaPcNyIhOfT226
	w0rpY7wN3GvfGXZluj5V9DBnoEPaNmssEPbt6Yfmwuf9KMC/ru9H4FhKmuCYUQspyJHMOLL8zRX
	vAYi1czlnhmP4eCxvv8MlAeBDmjvbeacqnIroWVm6cn36NvmqNvtLMFWf4MTmYHWddaTrnN7q
X-Gm-Gg: AZuq6aKOw8ehVeqfMmdOes4UZWpE7ZzI1cM0C0gilU1f/vYC/EHKMHqgr6qZRLs8618
	PJOat0GlAkpGnLfqWzb2daPXkVdbtQcRx4TONu8yJWZ6MGrYCNx3fdA2Z5N/+FD8Rv+ronKq7Lb
	3VVvLmShOSNCJJsq/bcKkMfvx2PiMUeIS8rG7FdtSmpQyQYDycAKD6RbxI0PERsNvpk32M7yUwj
	8TbPs+tZ8XLEmTCMyQk9b6/tp9I1rciUUkkpv6bLnT0X/JRFstegmK8882nauRF18zZouIhkgZx
	7LZtNoUmHacys9Pnl6zu6jCdKdL/loswIlfnS7LeWiB+YXRgUwauC2NT/k1H7KauFj9b
X-Received: by 2002:a05:6214:c4b:b0:888:fc37:f9b7 with SMTP id 6a1803df08f44-894901b1480mr18488556d6.25.1769123399075;
        Thu, 22 Jan 2026 15:09:59 -0800 (PST)
X-Received: by 2002:a05:6214:c4b:b0:888:fc37:f9b7 with SMTP id 6a1803df08f44-894901b1480mr18488336d6.25.1769123398739;
        Thu, 22 Jan 2026 15:09:58 -0800 (PST)
Received: from redhat.com ([2603:301f:1601:7a00::a701])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3855617sm39224985a.43.2026.01.22.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:09:56 -0800 (PST)
Date: Thu, 22 Jan 2026 18:09:54 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aXKuQtWS3RPF_LG7@redhat.com>
References: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27314-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEC0E6E679
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 12:03:11PM +0100, Geert Uytterhoeven wrote:
> Convert the Renesas 9-series PCIe clock generator driver from
> SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


