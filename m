Return-Path: <linux-renesas-soc+bounces-31736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPvWEq4Z8Wm3dQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:33:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB36848BC9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE7673011C85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE641862A;
	Tue, 28 Apr 2026 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8oMMZrH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k413qycX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB94640DFD3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408427; cv=none; b=JXSeqNRragIOLdzjdQKE8uG+TFRK6rLyQrYVuFf1vrpNVtHWKclh/NldS5J4EiGtgwoOfyuc65K3myYe5okG+AnGlsyd3cAh2FRy/4fGYiX5B5aLC1bW7XNvKf6QECW+h5PEB9e7ySycMTX4YJAwp4fVTbVGkYnGwIs3YUvJGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408427; c=relaxed/simple;
	bh=5W63L7vJAPPbkNRffUZ8GPvklygiDlr1K33wJZ2BgAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPm2glsH+BV0W0+7YwdMT7LBAL71CAgmXmwP5gjxIbnpvAx+W7z7GHcYJ/dBfnG44cbCmkNeor7QsPDSq6exyYCOZGezPyVZZgMMC0Et64rao7vyH+Zy8oCAZavNbvvRQ8eJutx9Lf0UhqWflbxvPWNue23pk9UzoXTNMCCZ9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8oMMZrH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k413qycX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
	b=H8oMMZrHwFBsNBTTqBiqrP35GDcNTBSAIpcTq7n+IKdHtSvNE0Sfxph2M0Uphdl4KC+7ip
	cuxj86KBYPkz6jib5D3ILCu8C3NvCRDqmRZ4TbPgaJIqfZzPBIFSjlqH8IOjZGv4v2q/sb
	BgEnWPVSBWT8h9/K60vdxHezYxvjxI4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-luEUz0myPK-Xnjr76NXCfw-1; Tue, 28 Apr 2026 16:33:42 -0400
X-MC-Unique: luEUz0myPK-Xnjr76NXCfw-1
X-Mimecast-MFC-AGG-ID: luEUz0myPK-Xnjr76NXCfw_1777408422
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb007bc36so22596831cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777408422; x=1778013222; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
        b=k413qycXZ1s7AQV+o4V9BdWtSu+G7FgiNU2M9ZM9NlPyZ9jlbG/NxXJSZ8LjkVAVt2
         1yxHF2+3dMCnwVYReqzcMAg6N8OUNzo6XBBm+6PGNuyDGh7Rp1TOddqv3FTDPOuG8+m2
         Y3+1fAsW2jRmGXmL04Hz4S3cXi+nbnxIMQ/W34HQta70+Nc93ApI+pxrD3BxXiu8kdwf
         eB6lQXrg+jNtKgH6/XgPD/ALtEkZ+VBCVvOxhtsGWmeyloepWiITAKL7cuuyN1kLAJzh
         ORxUO4t1rtIkAF5HgNc1m9s3G1HJZg6uPwTK8P6XN6Y5Js4eGxfS6nSznxow5BqsjlPn
         zMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408422; x=1778013222;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
        b=CGKJqMNGpvOsJaUavcOWqPKsw7VWG8a+UIjW4PD3bM/+509gUBRb7SOnxpJk0UXO7Y
         D6OHKYn2H8GwAT0wvhdI6XqsYU6lxcFyfzASuxiDh2v3X1EqtOo2GbyUgsoyvlgJzeML
         hp9HYiZlnBYyQ4xiuVQV5zhszszcGDxM0z5GEZU6Og5hNgeYlfd/FOpQ8c8jLY/c99y6
         vnaILMijRtd2LV5I/cZqwN4G9Oacdl51IkaWC8FeFsHob+Yxy3qTrzQmulesaVlkyEn3
         0jjsWYvsnBoNuGS7NQsnZwT0nT8mGVXhEASv6Ap9PO/7jqTXksg5C0neU1ZT6Z9clO51
         on1g==
X-Forwarded-Encrypted: i=1; AFNElJ/I+XdWXiwNpiOgRKbiR0mshtfwidN1QHx52XVtRpldnqTKIomQtlxMuEo78uyF40h4yTGom1UlOVxPBOsJuNGw5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQTyyJej496/R3TgqP4ToDDQLWByHk3joTeamMLSbcTKTkHQt
	qYzIjcmyUzZCZYaNINN7EUsvxwJfIm4BKpn/bKnBBRMDfmowYlH/PV4r1jsvHnyd6aW38zz2BrE
	dLcp3lZINDH8wZ3OgAdS52BJbRjS7d/eJ3Ae+POxzY0FClOPk+ayvXlmkRiBuXUj8F2pLQBS3
X-Gm-Gg: AeBDietS3IFx+OorsnuZopvSCnrpyoq8lBB9kBvjfrp3L0BkTrVwPkb93yHvv1NHmd8
	pevnvoMMQGLKIJYr1jhpkbrL3wolNFiNzJZmupj29bQwcy49CXDnPqzWkNqTWvr9pYnwyMI6isD
	To4E6iqcHW8aY8z5+1vGJPCT8KMI8NnG+s7UEFormvtuk3xfRrPXoz9UOsh7uFrq8Z/sC3r+1Xk
	ywOnOqKI3G2SlZ1J9GGXOYpBk1moFR3kHyz6ctFcy4knFzrf8r3bC4Du+LMWvo05ECKAP7ZLfxT
	JGKZMB0pU+Vo1aIGQCGvEqfYFllriUMqKIuwTJFmnQ5qa8D7UnTkce7DQrhfoebB3G9bQgzjgMR
	Z3miJM7T9afstLwP3pFeDK6oSZzqNKjk=
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18458331cf.32.1777408422373;
        Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18457831cf.32.1777408421914;
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da4d312sm25243291cf.1.2026.04.28.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <afEZotnIZYXEtMiC@redhat.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428201522.903875-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: EB36848BC9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31736-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:email,arm.com:email]

Hi Cristian,

On Tue, Apr 28, 2026 at 09:15:10PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> @brian: I'd modify further this clk-scmi driver, with a patch on top of
> this series, to properly use your new CLK_ROUNDING_NOOP flag once your
> series AND another (already reviewed) series on clk-scmi from Peng are in.

I don't know if Stephen is going to pick up my CLK_ROUNDING_NOOP series.
We talked about it in person at LPC in Tokyo, and he was the one that
suggested the flag rather than a new shared noop function. However he
didn't pick it up last development cycle.

I would recommend NOT basing on that series of mine to reduce
dependencies, and so that your stuff doesn't get held up by series.

Brian


