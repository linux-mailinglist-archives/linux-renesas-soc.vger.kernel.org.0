Return-Path: <linux-renesas-soc+bounces-34420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KlLpAjQUPWrhwggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 13:42:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA886C537E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 13:42:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NKDQY4ii;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1822E301B1E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2026 11:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9F23DC4A2;
	Thu, 25 Jun 2026 11:36:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2F3DBD69
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 11:36:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387370; cv=pass; b=s3TPGqV5MamQI9f4TzgfNA3ouSnAklWarogQgoSR0nPg09QYyPz10/y3a66IEgSzMgQdEyVXG14Z+PIkoPHuvg04SRdc8KbkrhCIP9wycB+S8ERdW0ghRKl25xQsSP0ixZtJj8/67hXEjXPU7dQJBuxOVBis5EZsLBRPJUhoIEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387370; c=relaxed/simple;
	bh=mqnxSrM0lxR4wBFtxZ2B9ZfKeGhkUzfpM42QYzDdZ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVoEtK56oUa13nXwQ6+RNeL4jpUCnkyjsbpeM1MiyPYzACuaAskoNYKeMIqgceVdnSnfHPj5i+2b0rIXmzztdAEceymxZmr0eoC2TISC8Sz1g04vzapP+QU0lIwqgX6uVE5WGrAxyGmo98L41562yT60BHPrR99VYwG9QXyZl4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKDQY4ii; arc=pass smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso7554885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2026 04:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782387367; cv=none;
        d=google.com; s=arc-20260327;
        b=XIzoRTSVnol6EboH4hCyV7iPVFDCqoDR1IKOaVuby58BvTqS7cGzN6QpO/fnGUXz0a
         iBEFUe1FqOfmVPpe51Sg9PjsUd6TcKk+cyUAV980/DM1rRoF+Oio2lDgl2UcvwzmLZly
         riEuaD8MknOPspMQvLMxr5WlCSR4rwWcgF5kXy6T0ORdr0+EFQRot81M7ywl1Xg03jBW
         RqqdaazO4pdryy1c7J/Oepr+u4uBUO7XVznIX2BME6bEWPq2MLZ2TBHt7iQ/m7CeBfc+
         iSh4pMHiKZCnUFnZolkoeLv0uH7gaE7PolZpYVFK5pCJqgyHLTWeqjaijlSWqiE0yZC1
         aOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mqnxSrM0lxR4wBFtxZ2B9ZfKeGhkUzfpM42QYzDdZ1w=;
        fh=d3Y+rqao1ygwoZNxQvp4981wZkliAwJf/Ikpw6CmUWE=;
        b=X8fqJ9DJaiQl1lL1/gY/LF+2xUoZ2ZzocyzV9eRVUmE6xhZOo03Ml9/Ak/444SvPZ6
         +5cTsTXr3eTLRz3MXKWG50OiN/nWX7q64FC55me13d4d3fp9/1zNve3I51Bp1mVYWh2c
         qkUGDByGoe3qeVNLO3VAfCEKPwWo+qWHNho7pgwgz6TssRoiN1o3nscI6R+bmI+11Jlo
         TsMfsgz94zciNdjwImtOe5UVdl7BZyKgfKMn8tCeBDG0VOHjho8wFjPd1nO9d2+8SYWQ
         MyhlyMYRETiUqdLjajB2I0E7+dC4Gtm1oWPU04DZ9tQSjG4rPIq/fuAh8E9iXILlidPK
         HM7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782387367; x=1782992167; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mqnxSrM0lxR4wBFtxZ2B9ZfKeGhkUzfpM42QYzDdZ1w=;
        b=NKDQY4iiC1pzT+nEBcG85Fe6ahBlvFuVcBJrO1hHh2hShcva1T2soKT7gJVRKAqyZi
         QdNEAf64eoycjHyh8CrG0xnu1IsuKKVQETLCLHLbb8TcJyPd9ywZzJIG5qE49FOE8Z5Z
         +nGmaE6cMKmh6pmcZH7MtUkvC6mZYwyvDJO4C7+gk0xmEEL+WCM/obxobNVZbkMkWsRn
         szx2WCIPqZ8mJzAgBw/KC2dKpWgiExI13icoguZ0ZkXlHBG0/iELxJlq3SGjCf1S1WTy
         qBJRzdTXk88qi488PdItExni99Cgo59Hn3OqDRHqO6lin8CDmxy6kTQclgmn1+5UET4o
         m2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387367; x=1782992167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqnxSrM0lxR4wBFtxZ2B9ZfKeGhkUzfpM42QYzDdZ1w=;
        b=j6qtZNn+yVvqJpHGFsThkgv0ONb6y/Ccrkdz3YjWvNEfMg2PIFBEzDVlGnsw5UaWOE
         t4q4Fq52gNmFgC34vC0qDvrxve/jPuJFtHZWsMUslEetggB6FtPcGkdLcTNmu84nN3n0
         HRVUasQrYRm+baB4yHrmch/873TPX8mv3MaGDPQcQVjae/+iEsSktHnrAt0IPBitv5uV
         oGvfHcIXEy6YkxbW1ZI7AH7smm+TCOQORiAw6NkLS2dANvkr1+LsJD1XGnvawmOSJOML
         RNKdtJbWBVVSi1j8ZVKrXZO+pwsJeOS6wjW0g97ND/ryjm+y1wETKfJytW14ICXOTcha
         nRvA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zemb6IDJiINLmx1rtTQUbx4Q79DEG+xuQ79A2E9XgtaKmfwOLnjt/D+xA1BBmD2QBe5jogn8toz35WVwc2y71wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6QLnIlsNQF2q317tsRK/+BYfc+BX/lMS0rJNValkKvjxWpJLb
	nti2eGabGz+KhAf71diEcgYhNOqwSSrvfbqCsez0QZTA20w/MjmXykWQtQUUFrD1ecn/33wpBH3
	Rpg84guPdSzo1GCuJKpAPT4tLU2DWn9I=
X-Gm-Gg: AfdE7cl1Nq2zFhoPI7abFDLyDhnO85XX5ucftjU5sT8P7juKSdv4fxNQLeG7hgy6UuP
	8GOfnMEUVhpx0EcWrQprRv1r+RuBrs6zyx86BAYj5SybVr4wWHBT7AWP89wtEZsHC00t96JQ4Nj
	ANkaeZ0WxLgdzVDaCxhDTF1eRxslxhh9hJsYAGqIOvWfx5fMVYvHgbc7GxybVJBLnYetS5Gsdrf
	7FkWfTDRJg9T1kdLk+0r36CPLuLYq4Vuu0JPoA/qG6Va9auWk+VFY5hKGKZqlHopDaQKMnh
X-Received: by 2002:a05:600c:3b89:b0:492:37a3:acda with SMTP id
 5b1f17b1804b1-4925a0444c4mr179542695e9.0.1782387367114; Thu, 25 Jun 2026
 04:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521144755.3476353-2-maoyixie.tju@gmail.com> <20260522150214.95651-1-maoyixie.tju@gmail.com>
In-Reply-To: <20260522150214.95651-1-maoyixie.tju@gmail.com>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Thu, 25 Jun 2026 19:35:55 +0800
X-Gm-Features: AVVi8CfJMLI2Sng1aI6l6C-FWjmdEBjifoGjzPJg9jDE7xicikpiLptFGKbuLY8
Message-ID: <CAHPEe=FfcGHh1MaNW4e2K2P7x+C1KG+xzpD8r=c8q8_CGesgmw@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: mpc512x: fix dead empty check in mpc_dma_prep_slave_sg()
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@nxp.com,m:geert+renesas@glider.be,m:dmaengine@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34420-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEA886C537E

Thanks all. I'm dropping this one. Using list_first_entry_or_null activates
the recovery path, and calling mpc_dma_process_completed() from prep context
isn't safe. It runs client callbacks inline and can roll completed_cookie
backwards. The empty free list is real but rare (all 64 descriptors in
flight). The safe fix is to return NULL there without that call and let the
tasklet reclaim, but I can't test it on hardware, so I'll leave it to you.

Best,
Maoyi

