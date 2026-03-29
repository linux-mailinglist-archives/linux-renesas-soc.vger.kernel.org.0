Return-Path: <linux-renesas-soc+bounces-30554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KDoEG9cyWnVxgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 19:07:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF9353394
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 19:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3381B303B2EC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A7D3815F0;
	Sun, 29 Mar 2026 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpcogORd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA8376496
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803949; cv=pass; b=BFBXKEdRSwx3OfpPg1mw+JrKVHmkZX6XjtIx59RQbIy3ZNj7fKHevhTKQ0Wb4TbAtrU1ithXliIm3Oa19+cn3huSY+1Aot5xV6ZdEJNuOllukrbbZbao3IWqktZWrPNLNMar0GfKviNnvGaSnPYOsyzKPykOm38TP7iUY0I6HpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803949; c=relaxed/simple;
	bh=216wM6JJEUYywxBXFCc8fEXIHzrCve7hEEOjMWeSLN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msayOL7HGKRd9uJPDXhN2jhYTEUh6naiSIsqz9UXxt6eOQNtU6Msj4fD9dbhYAt9WLX5tsK/mBngAkqxEenw42s6WqjMrfCmo4E/uP8r2Rjdr7RZgF8TNTbGy4Se9TCqZ5kk9ns2b9V7fgSZQA9afrVNMKfJWUn+4+UiDA7/flw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpcogORd; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4c383f2fcso3570846a34.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 10:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774803947; cv=none;
        d=google.com; s=arc-20240605;
        b=FI2SsuDqRqGpzNej9PIW48QRjmS5uN8MUuKtRg8w647r1Sb0ZP4XXMaun8UHXfFZB5
         ZLeREZ8CTblNbnu0/QAO8GpEe7ZFpuYxqV9JZgxRCtKmyF2lzLA8i2Eg8+3rJ46LFIwl
         WgYKrXuZX5AArQ9La2QFDKYQBywLEhMZEsfZcab9YlL5whphbgkrZB07eAls4QBWsEYr
         m/SGhuC0iq3wyz3qrzSq7uUMKVJn+auxV6L4S3LaUj/D355aOAt1fNJ4GjqOQ/Q84+ES
         d9cz+ZS4O/zBqkCPy41yzOygoAJorPwgNRB2P5fzAsYjYN2du2tBYR0iwgtzEQfejgnj
         Po9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=216wM6JJEUYywxBXFCc8fEXIHzrCve7hEEOjMWeSLN8=;
        fh=DWz1Gu2Zp9Hl2mow0FOXfh77z4TiBInUzSGYf3eAFCg=;
        b=XRUQbS1YNrIX452fSRgDopTpDcYkxn8hMZfOLgKuLhKYYD8pyris2WyuHMken2DlrW
         XNdUfrZiVnYCJ1xcsJsHTKWx4Vle191p0PcIvtfUfZ9kYfAFD+whdMyf2bgvm9ayBde9
         yPWG2i5k2wHXsMwMUau97POHdWyKkFVOvPIoecK8vLZqADqv/UHeM4HNMbpJAYnUv4Yk
         c05VkyvduS0DHSq+XLGbn4jhZ3X+sg44YF8IAGSkwIvQqBhav7z+EG7uQHWke4YMrh1f
         zYlycW23LNoK0S37DgAROjaYm+lPzEO5iBXTe4MCwyDCCWodxrUGNhBQ9cCyFnR/L/15
         DD0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803947; x=1775408747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=216wM6JJEUYywxBXFCc8fEXIHzrCve7hEEOjMWeSLN8=;
        b=HpcogORdc6VMk2GbPczyVnV8uZKIo8B379uMO2vp7troFP0KM2xzM+2BiiWd0zdC/b
         ZkqHUv1JTZc9UfMTftB6KxeoNuwPqFBHR5XNB7BpBSdx8mblx52ZJyvWo/bDfnNxx0H1
         fEeCmY8gTzFbQLrBLLdr2gxmTKiVBho/9wAw5jT8vIAkmkYZQWnFwduPSWoC/6jq0AZN
         sOU8W2CnDJl6mlzo8TxBYGVMUWhfroDZkZAL47aR2B/dMwL9AlrJRCvdTQ1GZclZWbe7
         /LAOK7B0yplW6crkg1JH3/XVIbjuCbO6yeVecZNZcBuUj2fDzOPdu3Oa7x+ACYcK9+vZ
         1n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803947; x=1775408747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=216wM6JJEUYywxBXFCc8fEXIHzrCve7hEEOjMWeSLN8=;
        b=WfqcsLnryUEP8s03KPHMiOEI4QMZm7cRGsOKZqvYvHNlXhUGaH4RnIreqBYKmQJTi8
         1DkQvCC4i6oxuoAL7hUrMH3DgH6Z8DA5LXtZNmyU/Gt/s/vDEGNpyjri2kuOgUZ0JdR5
         Hn5S8Djh3jYbdd+aUR73eTyEGeeKNHCeggRwBkZ4HAMJSeldnQgnJhaZD9SsaghzRLGG
         6szUaeXUT2Js1ZC/NZvP9/mxCBClTnSVPpjfQN6pSn/NumUr1YFKVWIpc0AYXC3HlQn2
         B2AMO7Tudib141Awsz606xQDP90fiC5jVxKCidSUNBLJwK5LuxhNaNo7xw+74S30ueU2
         HXdw==
X-Gm-Message-State: AOJu0YySrnQ27CJvPZzQHlK5Mm0dM/cCe8bVT2psQRQtTBlQWJ8exLf0
	nWmnX9ber7JlT0kSp8lW/QabHq2oaK+6dWq4zqDl3/FkyRoo2dK6B6b0pzH7Tp643xVtY8qVktV
	abvrFeGDkNxT8jW3Earl+QXQaKfKoas8=
X-Gm-Gg: ATEYQzwkaEQcGm4FcU/hHGCP+153M9PfA2JaXPgYDbm3TDspTwAKf2ufDJvWK4Cn63w
	lmFnpo3Cis8cwk5qBgThNeUWl5a36XV52j5OqCkaGc0ezOWCLdxXk5BrcLRWI9w2AgMKWMbHccz
	25YTKtk8/nrKEeKzaOd/+SxihgGuQHylbQ9xoZWWfzR811yWAkDfvRY1R9sCOshtYyQ3IgW1K1i
	f//Chk7HQUl5FDS5orSgSo+JJQh1f0MbPsJ1wIS3O2TATgn977zKlGV10+oIfTAFAx9Dk8qxrGX
	aoTFU6+0
X-Received: by 2002:a05:6820:2d06:b0:67d:e505:cf49 with SMTP id
 006d021491bc7-67e185e4094mr5668247eaf.2.1774803947127; Sun, 29 Mar 2026
 10:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com> <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 12:05:35 -0500
X-Gm-Features: AQROBzAh9Co7mhj2JH9l3T-F9mR5CVl-iPOaHx_mgs8VQPzqvHiKi8oSC0UKPWM
Message-ID: <CABb+yY06e1boahM5CL1MNBKZj6DLCmGa-hgsfMDcnTn23h+cvA@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30554-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,renesas.com,glider.be,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email,renesas.com:email]
X-Rspamd-Queue-Id: B0DF9353394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 8:06=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Renesas R-Car MFIS offers multiple features but most importantly
> mailboxes and hwspinlocks. Because they share a common register space
> and a common register unprotection mechanism, a single driver was chosen
> to handle all dependencies. (MFD and auxiliary bus have been tried as
> well, but they failed because of circular dependencies.)
>
> In this first step, the driver implements common register access and a
> mailbox controller. hwspinlock support will be added incrementally, once
> the subsystem allows out-of-directory drivers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
The mailbox part seems reasonable to me, apart from the nits already
pointed out.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

