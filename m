Return-Path: <linux-renesas-soc+bounces-32923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EK/B+gVEGqsTQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:38:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF25B0A99
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1EC0301C159
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 08:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3820136F8E9;
	Fri, 22 May 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCRYXG2f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8A34DB74
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439059; cv=pass; b=QwyFeckKNqatUQy2qFrOR6B6MtEcznjmbgIW/4HaeVpNYlBxm8dAHwEJzBCxQWHX+VEwgqsfAMMq1CZvC0bRtBfV3rKxIpwsYtRkLXHqwc3zh5OHGDHQiA0O8GHHTpfd+ZzsQiuJbJp5JwTXFNunp/7Rw9NRcJAVTJxkcgdHm0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439059; c=relaxed/simple;
	bh=5nZquihbPzKQf2TTL4InKJfLQQ8/TPP//zh58s9RtqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OylWSSzj5Z5Bqpwj4HMomm+ad9ODlykOrECli7Cywx9W67zNWI08zGpujSGFvKIchHcB4s/BegaPkQzx77choUYLw9I2CtdFuoeCLr5krWIUbyltN2EKq7ODzUE/G124dPRHdEGkj9o/KY7ZLBaAODBL2+2n6E6yXmhJbdzroO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCRYXG2f; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so3850009f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 01:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779439056; cv=none;
        d=google.com; s=arc-20240605;
        b=HLRirsaC91XZJOfR9ztKLfhGnrZn+OyBb/Zh0rsb0ghxqTrXYrBQWVhoLSLWduJpDB
         8/vO45h+/nW/Oub8zQLPsJM1hK/LG9toI2Yn1Z/xfl1buO9F+rBNaPyZCH3+TBv5SPm5
         vrDfyev3rpvDWEpGsx60RpZajeVn3qjgaLfKAxGdESN61St3Gak3pJJlQWHvn2xBdCne
         BTUdYiJpVxYJDnsG5MT5Yu7POsxmq0tp0yfReuIDsPZisXD/FNpVxTa0UorLaG6Qa+ji
         Llcm7CiC+IPSkjSVHoRQoVPMBkWYklDbyNjN+nAXWkKW9GD5Kw2e4m8e5EnZJK5kFoRr
         PSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5nZquihbPzKQf2TTL4InKJfLQQ8/TPP//zh58s9RtqU=;
        fh=uy1tow+algg4z1ZODsa3YgRvU9gZwcqr/UosL3v0auY=;
        b=LPhKwb2/mAYkFMjkBiMKx8em2DU2xEZPJlbvGCUBqxrFjItaSNDAvenOenKdOTdhKK
         2HwdvULxwSqQMh2KvAu/1MFD629Y9FjWXJW5g5GHJ8HWAyDt9hYzrU2BY27DTFeAD603
         21JpXwHhASKFMfJe3yrPnrtFlcibB9Qzh4j1lnxvfRQ6fHBSUD4xv3MtW/Ze08tQdty4
         ia0qudvzNHTqiWlim2jVtBxgvKFdBIKp89SN/86w0DsWZtJhHF9RLOpGjazbKfYBIf2y
         QCi98SpgeNkm1cWQJiJb1yGZjcRI9Cq7PgTILMGoffzzF/nT+bIdEAk8BDm4YFj/wZRx
         bS+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779439056; x=1780043856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nZquihbPzKQf2TTL4InKJfLQQ8/TPP//zh58s9RtqU=;
        b=fCRYXG2f8rUjFAlDN4Et0aelckEz0AqVX+4TokxuA5aOdyxglggKuTytLKVJnDg/GS
         zr53NSpcMzUOzoecTGNSw8+jMpoog/XrTGya4AEqQobiOsLvUqD+fZLmO3Yg6a/Krp0n
         F4Tk6f+eeTHisp2PY0gR49B8UYUdUFxwboBcPEbDRt9wz5z9fAhQbRROdZU4GLOJFQn2
         Phzs0ziXdtq5NsWRgjzuIAFBcLCM4uar2HE63sQiX9afLzGolbXsBVpb48S0sIS0z5mV
         PKD3hXN7WPLY8i+3q2dSQM3q3McFY7YIPIgOMJPKaC9qLG/chNOwaZJOQ+8vvn/09dlH
         36jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779439056; x=1780043856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nZquihbPzKQf2TTL4InKJfLQQ8/TPP//zh58s9RtqU=;
        b=qPKJlqlvid1V2BuMdndLw59VFBdlcq3C6iX2uWp1VqL9jKNmEXviFw0NXQyEJ3hUNs
         qIi2NhA83vW7GRNhm+mi+egjd6p0K8ccLFgn/GPLnV+M+s6Kcwxg3ilLNuPB2nsD8Vvj
         FOJblYSJbCH3EoLZYIN7sCKiGc8fqDm5cPZ6dvqrT7jwHs5ZN+PM3S1dNsNKwUDvmT+3
         u3XegmUbfIuVsWGvMgrzEtLN2bxIvOxm1uUz4F+Dv0Tu4O1K0wvt0oMIJ7PgVXM6xhi5
         QvSMa3x3DLtIU/L6bEnnudBTiSLpxD51J+JeKhRlGETlD5T3EIw0Ue5i+yyGQ4s2AAHz
         ROdw==
X-Forwarded-Encrypted: i=1; AFNElJ9UuqNFpbFmAwnahWWjjRFfuJbZv8xE8bCkGzlghaTu1PkvwFhEHlhKvgy3vxl/wNiRqqcyXCHFLgH2zW7XKJF39Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0PPKModEg0eFvJt+tJ1jIZHTc+igJwAWgU6jARf2t3II7o8V
	scSccN/FEWyolNQJDqvq3BxTeC3cscGHryVaARVscMeA2iqdzLG37ToduUi+OnJbk4wG4FHwcMr
	fHEL6gLcME+yvb8q/RziFnxkoGjRcmYA=
X-Gm-Gg: Acq92OEYCnSxwcBPK1jXPva3om8CiO3nC9gd3Sh/qsOEaziG6m1DWZdj9S65HQaG4W/
	T3WzuyEd6kEdBspLgx3f3GymQ/rNqcha50F5bprtysy7ZHu1xCkAq6jBnIJdd+jp/n855I0xTvH
	LLwTTEqB6bdgWNuu7TpHelpuI5XF21IApcxE/j4V8wLXr+uP44F50ILkmICqc598Z6Bkc3A6ySE
	95Q0bUXtieEm8o121RnplKncd7RQcf1tb+W4rw7Sp7w1WerKRcF6hgN3ozutCbphjgiT8SNlBp6
	kZJRYmpp2DlJ3mEEGEcc74Dkkv2pAQ==
X-Received: by 2002:a05:6000:298e:20b0:45e:9db6:89ab with SMTP id
 ffacd0b85a97d-45eb38b38f7mr2456719f8f.25.1779439056071; Fri, 22 May 2026
 01:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521144755.3476353-1-maoyixie.tju@gmail.com>
 <20260521144755.3476353-3-maoyixie.tju@gmail.com> <CAMuHMdUOrE0ouHo5759k8ULpFPBS=gyqd7A_k-RTnSSk+MPGvQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUOrE0ouHo5759k8ULpFPBS=gyqd7A_k-RTnSSk+MPGvQ@mail.gmail.com>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Fri, 22 May 2026 16:37:24 +0800
X-Gm-Features: AVHnY4IZW9UefcyONbqHFIZtE2bXlYDU3wowxWRCUtBJtijkfj1oSK5EbNUHndc
Message-ID: <CAHPEe=FT4giuwRdCTGt6YKSa8CDJTo3aFXOAzrpn5Uh4KZ5aZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmaengine: rz-dmac: fix dead empty check in rz_dmac_chan_get_residue()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32923-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7ABF25B0A99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thanks for the pointer. I had not seen Claudiu's v5 09/17 series.
Looking at it, rz_dmac_chan_get_residue() is rewritten through
virt_dma APIs (vchan_find_desc + channel->desc) and ld_active is
removed. The fix I sent is superseded.

I will drop the rz-dmac patch from v2 of this series and send only
the mpc512x patch.

Thanks,
Maoyi

