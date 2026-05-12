Return-Path: <linux-renesas-soc+bounces-32445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Dq5JPqZAmpyuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 05:09:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC65192D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 05:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF223025D10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 03:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7575E37F014;
	Tue, 12 May 2026 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddnheo1k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED673603D8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 03:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555365; cv=pass; b=h3TlTBLYo8SzemgfH+pdf8QjXnui9Fdz+U5YaFAOjkRfQ+hTFqp8GgmvH6UZR/okhSHlys3hoOkuMTWxsn+3qtC61i7qGXF5pQn5pii0eWdH06jH9cF8XiwM9r1LDfDvBUozbCJg8wzwSb9IAwUJI7gizv0/IrADiBd3vCQXoO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555365; c=relaxed/simple;
	bh=9QKYX+S6lwwCw+mTheY9a+AJP8+EDfhOnBM9LIQmtAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFNWf9JVXSUxXDF8KviARaJMfSp+2ihTV9DwzTor6gffi+9E1HycofEPjK0yIE89qa8QhzwLmVDDAR1doKtqdboCpLOeEYetgRaUYizf+sLy/+PbKhpFgakpDrWwq0LJUJTjKzKgEn7pdegU3jE51m+c9uLIS3Tlb9YXH+5c394=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddnheo1k; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-367dd53815fso1490721a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 20:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778555364; cv=none;
        d=google.com; s=arc-20240605;
        b=hNJv4H7FF/odRGjFF4vmTbMshsQd5juWp91gaGEMFNaTCGuSOvkRhAEePUHn3pOPgC
         mKq8FbsDl4kQu7zig0po3GXLZKxj7wwTxym/ldAd/j7EUzs7cZTC2G2uWYhux2BsIHBI
         7PK/TAWxYbUBYCfDYxW3guiUrG6YP6wlY+LsgEBbZ9cHL4xe1ICBidwM2kXllhYLtCEG
         fzCab2S7321kFErPCtFieQUZh8WOLd/XlE9d82m//VwPl2x/SLBzEPOFGIJZIigrEYvz
         F0kAa5jSPqNElIkWG3VWpz1v5LSSm5hn8VgrL+bg6nQgL8eSpJBChK4+HL26UqJtVxpc
         imNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        fh=n3hNK6JPlcs2KKppyC4FXrJR1q5soIvEo2IIleOxrzU=;
        b=h7hd8njjLKpJxENQHf20CQ9I9nStQkeMY6vHr176/PU2vtB2HtKN3jnGDY3+w2AAxL
         Gvm9oTf9VbihxGfm/RRTfVQ6FnjsMDimTkQ0swvvwNppyiYrKL598Du9Y+d+h8KsgtoW
         b2Z0q3CzFTiXQAkJourOYqeEbd4Jh9WCj662eu3mye2pt3IwgkV8+q2n/MTtc1Sw0wNP
         g9vAAy2qJuoDqc0b5QkFXVbCIfO52xvRvc697NUrY/WH4LnfJyVf3iMeEfrMAV4iwPoM
         9pz59bmPuIRLDqen6/qbW+XU42rbfcm+g2cpdcJZ6I+DCWzPlUIlpZ1+uwFp91mLaHpU
         I3UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778555364; x=1779160164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        b=Ddnheo1kcPdtHY7nXGvQ1mOQTIIxk2Pegk6HQEOWV7GNaDBnpppFUqAvZ6IE1DcvZN
         FFkPSQYJLXiTTYLV212K37Wo2R3LWY7+d4rON3tWs2LV4CpZ8Pz9X4lFnwkYp4v1bZoh
         oLJjuUEPaF45YPueJF0/eu4ZXn1S2XYVEeBa6EBzlqOhGkGqRFsizOr1rdDTk6ThnqRT
         DE4xkUMrxErQjhPEniJxM4qhap8qRyaY4mixq2wlGE1MToVDaQ6bILfWhhOkg46dETQ4
         Rf8wN0cLtXKDxxOBoT5q57Xnl6w/ny/OnIpTwY5a2I2feU0abYWn9fewpeQRQQjdoVE4
         Taow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555364; x=1779160164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        b=l0PKIPy+LlPxsNqVaTRwBs4VybjAy0bmPsmF8n7xGit1BlGRnQoF8/5gVWAADpHNmd
         6diuXiT8vCSYF18Jdnxhu/KAIg0vcJX8ppZiMA+PzOz8Im7BuTm2x53flzOQZPavpski
         BSo+Jj7DHsA5/Uillb7dH4wMl26yz2mt5RLyZ/Xdtdl5lsKImeA6V8RrEll/lLcyLwVl
         uNjzhjl7H7UQuoBlPL5Tya3CBhXGsYzc5wW0ybv2uFvm119sYKOpBfVC2/q2dizwLTo7
         qjQp1Wx8vtfrfxJyoJQIapfLxCju2F4tkGpDmRq0Cw8lyi9K176m5UkyKPNpvAlRKfYY
         KD2w==
X-Forwarded-Encrypted: i=1; AFNElJ8KAGErgGeby3EJ5AP8yBllHuq/PmzNKFj22kJdHFDt5tB9pjeCcrKrWpDB51WhA09VDtS/dbyIyFZ0gMkR+8ezng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKD/0ftNMHt2ePMp7Au5okMGI2C2btEHHOzGbDFSu9+AmoUzAR
	NAFIWpbs+KVcK1+SQBnozrh8vWwj5MM/Gim0BxF0ujX+1Rxi7aM/aLimFjaQtC7PRdgPgtX9WRk
	JuFFSFGCGGfKB2UEIGGrbpPovXOntHPQ=
X-Gm-Gg: Acq92OEXW1rrqUOou8xZujL8sNcPnGpHBtrOJ2CEvXYk8rvjG2gGf3wy4tZfdGVSy1r
	oIXp+b9hWady/hOOxr0zoQsfH65Z7pMscXkRUDeSfQ440p0hSSDnsBmX5mrxQZxxovrSeQpFEVJ
	io7qCQVqjHI3uezP/kjtsxoTePB8fF1lMHO13l7KSN4T1nsudqEiV++LFxKzKfUO2b0JElNoGdV
	e1195aSg7OozbZw8sTl9x9pRER+7HnTNHxrnpHjTNBCLTD8iUwopxUen4IwigFbQTmS2EgQmFZP
	t9lSUYjVXmcOLp5xVY9VY9g1EX8fuqx1EdtlxQ==
X-Received: by 2002:a17:90b:5344:b0:35b:d795:cf5d with SMTP id
 98e67ed59e1d1-368ab8638d2mr1858065a91.5.1778555363550; Mon, 11 May 2026
 20:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-7-phucduc.bui@gmail.com> <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 12 May 2026 10:09:12 +0700
X-Gm-Features: AVHnY4IsmAqqmxNkupkaRxtbCeEPAZIEnld7T-VRBsXE0b6nsq7nw4VOw_WWfjU
Message-ID: <CAABR9nG4cxwX_fjF3yihRbDP-qb4AxAeZdSww2ENY4eE5ecHyQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 32CC65192D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32445-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi

> Am I suggested this ?
> clk_spu   should be merged into [07/10], and
> spu_count should be merged into [08/10]

Thank you for the suggestion!

I will move clk_spu into [07/10] and
spu_count into [08/10] in the next revision.

Best regards,
Phuc

