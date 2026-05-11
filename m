Return-Path: <linux-renesas-soc+bounces-32365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP8mFB+uAWoqiQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:23:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A543650BD4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AB43300CC31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1390C3D47C2;
	Mon, 11 May 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKlubvpx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900673845A4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494896; cv=pass; b=pfoNB3hrJe7uVT0J936K/eeRxr9Q0TwO6AjrN2WnYjbdMKBL7uDtXWvFVR7IjJQECRMBWil9oy+/CHosgfEwpOuisCc3PIMrALX0eAmu2hudi0vvZnu5qAT73ocvU7kjCHeorv/Mi4Fpxc7NEbP4Un71CYLLwPI9z+X3OwXwi5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494896; c=relaxed/simple;
	bh=dkEb+Wt3jNZ7JLdXZ5Wg/1bN5QqwrP516+C9eqWt/hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI32wzDQK2h0bPUvj/qLCRONMiEaDKzVq39K/e0AbFchXu2qQDZbyV6OQE7n5pPUnGw7MZoyk/aSPe3CqLXTi5hYYNcqCXOfwPgCGwenIywG87S48bVT3RUpFpI9nJiakVETPfraDwQvX4uU/ow+C4MhoZBvh3daOR0XWb3DxKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKlubvpx; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c80227c9572so1780905a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 03:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778494889; cv=none;
        d=google.com; s=arc-20240605;
        b=RxKH6UtVStlhujVDGE4IAsu3HZ7UYIBWbs9XmTRHHW3ui7xs7AlRdxywE0bVFtH8Sc
         UPB30o9fLLSutrwN9NlMrjJQqOZp8roSSjvZxDQQfEHL/SrrOOUi0p7F4xv0sArLV6ay
         HaW8haQfLaGVKvcz7bDEAs8N8cYirKReBD+hRzL5RcqxOCD/zSO3p9Q9O2zIsJQdxeqb
         tlZxhMCL3NRfB7EBvre5lY7biLx56i9NZuk8+iAS9LG/1w4/jE0q1DNcC3B+udus8Ew+
         OePTNkWpOcwNg7DjhJjeag9MvxcNnU60QGyF2QFzx9GTbtZWhPaS8nfS6TajlNh4QDtN
         J/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        fh=bBYm6+cpeKjx/Sw+nWKW3XS80Qkt/ecU2rkxPDHPfzA=;
        b=DpuNaGCwFJCkWD+IMWvMEcKaApmB11DbPBTaOhaDMLM/q3lV5vlX0+ZasD5iCosYPw
         gvXi/dOorjfxEf1R8iouQs6fEe5G4+5XC+FpRr+1pqFFgWvIojO25LfxO1zQ6KGVa5sv
         0yZb1WibAloDC4JP6djmAyzFn+vSWgeeVjuXyuR+nMRZyOGvYDXLSEad318MwDkitpVq
         7J8xcy+u2tlxEJx6kTQNdcFw85v0ZvGj9/eMtVSscOSZ4CY+mOfY4fyP1LmjLLh2P5Iu
         sOKQ5jw14pFmHHZSlnaE9U1gnBsB5tkU/GPwv2TAMQIW2akMayl3oih/2QN8Mv48Lr8B
         h4bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778494889; x=1779099689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        b=TKlubvpxaacU4fCHJVBKa3ddo/C14LWWPTkXz0YQ1WZv0ZfDtbn1Nzl2OG9reivtVy
         NQe90vTscyd+Mai28pboELuuGMc33sGakLDnItGb8JNi8r9RU5ISHpKZwGFZNR2wzoB9
         yMfPu0CMMTZTn+eN36JC+T+Y+O4VrD0pnYl/ivXE+qxOCqXnUxiF5coTp4KmGKKfBBT5
         Z0j7giizMjPtvDi0NaCK7E1NQH4yRFIjfv8dnkrpZexAlgGpN8bSVp9LnKSS5RlzVDMn
         K5YbUhSrWUubD3lrBziMvQ+0O+beKBCJEoo25BccFP1CyoKd1IZOoCObfP7ZKYghitqa
         WRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778494889; x=1779099689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSLz63MUrqkuJwhVPfOGrb+NpbYDw8jzgq+4u8aoMKg=;
        b=h+MBFET+Gg7F4d3Z9r25iGEx0mYXgnT52PA63ZWgVFNijFFvGBsCAT6VqXaPF3sELP
         cEysy/kK3XICCrVA/JxweFiDvXU+iHEF/+cnTH2VuaRQbstPrSRURZDaSUi7GFMbJzCq
         uj6F/vRNiIp8snyHvXqNT7zY2fTNMESUvdCBF8XV3rQgYJBTuQjeVKlPkVupmlYg7iAS
         AZdUe6U1hY9Cl8chKUl0yotaNfbcOE2wEym5aCEM/5umGVNy0MuX97v0Wr1u6D43kDu/
         +16mPfyf3Dzw5LIysbf1wL+INfqBxK0ogwGp3WH82omrBLkVyAsHSEwUlXNjkI68ppW0
         xluw==
X-Forwarded-Encrypted: i=1; AFNElJ8wASB0comkM9zuL2aR28UoNcA8c9gwg+KJnidujxECN4JlKxhbWf12i97mQLoToLQyoqlX9vwMc9r7E1bIMdUCig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3gl1MwR+C33oVErN021ppQTXywnrmG2pygqjV3MaQB6xCU775
	RNIRnSVpkp1Gd7x9QNu6+LxneczIk4b2056RhloC/dku/+4Wt5oCvJV85/2NumfyOE+Jb0dvqvZ
	8vgXRzNFr+KV4YFJAxb+Adfrzn+91+UE=
X-Gm-Gg: Acq92OHTtKDdhHYQFvDOzTu+I1gYsUbH7vliXi8HiYHPfp89LToxqKC0M4hcEGRMu30
	PHfFasAJRRas/vaSEkmdMVBLd/4tkf1WOw34nskbZlEuoXoT/d4nRS3WPeK+hV/4pK0PuOGzdJJ
	NqBRQUzYJjjPQpI8hFerdLXs8aJPxVkLqzZiGrrk5bHIZPwRcOSWrpO/Id3AO+mMfQgJJgARO4Y
	2/vg4EBEcacWksUfHOOLRv33QwMLorpSAwRvH83Gp3aZXuPSmkC+Hb6QrWNloQvUHREwQGhQo9C
	EJJ64HknHdiXUPwCOD/DI+T38J5mZKgwrYHsQg==
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id
 d9443c01a7336-2bc8634c747mr87342615ad.21.1778494889207; Mon, 11 May 2026
 03:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-8-phucduc.bui@gmail.com> <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4u6n1tg.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:21:17 +0700
X-Gm-Features: AVHnY4J2_VlHnQNv7lKiPmK0Inw9w8zGI63uUFFjO1owsEGryveB0MVa3vPjntE
Message-ID: <CAABR9nGx0gSfL7itmG5WYiqUq_SN0GoVp85NerZ=MrbYncq76Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A543650BD4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32365-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Mark, Morimoto-san,

Thank you both for the review.

>We ignore the return value from fsi_clk_init() which means deferred
>probe won't work (as well as fatal errors).

I will update the fsi_clk_init() side as follows:

if (!master->clk_spu) {
    master->clk_spu = devm_clk_get_optional(dev, "spu");
    if (IS_ERR(master->clk_spu))
        return dev_err_probe(dev, PTR_ERR(master->clk_spu),
                     "Can't get spu clock\n");
}

The probe function will also be updated as follows:

ret = fsi_clk_init();
if (ret)
    return ret;

Do you think this approach looks okay?

>Below parts are clock->xxx cleanup code, not refactor clocks initialization ?
>Please separate it into cleanup part and refactor part.

Understood. I will split the current patch into two separate patches:

cleanup patch: includes the changes converting to devm_clk_get_optional()

refactor patch: includes the remaining changes such as updating
function arguments,
moving the function call locations, and adding handling in the
set_rate() functions, etc.

Best regards,
Phuc

