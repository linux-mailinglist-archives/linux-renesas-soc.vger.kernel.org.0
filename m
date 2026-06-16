Return-Path: <linux-renesas-soc+bounces-34059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O0MXMVoUMWo8bQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 11:16:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0E68D6F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 11:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HobfYZQR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06E853019C94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 09:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE7A35F180;
	Tue, 16 Jun 2026 09:16:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A635D615
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 09:16:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601368; cv=pass; b=WI8/eXHTnyrDmrfxyMAH09T8G+mRsrfgACoIwaLVtnyWZqXRvrtRnlpWINyxNPFO7rV66i3u5jn44pGEkF4eRMPJdkUT8MlENPTUbIlolHJTwGk//KI60Oi6F0ttA0iwlklhNeJNn/tqgRQXB+GEsl707Jc9H1NBf8v0Dc8yAFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601368; c=relaxed/simple;
	bh=kISvSbUir3l1OZYUIvvYdcVsXIjmleO+rZ0vgo771+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfIYV7PSD2Al984crM4vW2sfOBlg+cFK2jYFzwF0ky1U2vLxAJLQui4eFsr9X5iw8ClwWONPFYBNZeJVYLd6rglHAyUAd/xy5GeXxX5up7fWJMoEk1pyrq8311HJbZQYjTPdKqm6VWhB7MSMnCArGAnLnMCZTB1zFCaKfOG060w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HobfYZQR; arc=pass smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3233903f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 02:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781601365; cv=none;
        d=google.com; s=arc-20240605;
        b=WFHrSbfqKBfiFIlvUfVoPSIiJeZ6Mii0lwplRDjY5bXWj+QEm5S10+L/re0S4w2NyE
         8sWRoSlda91sikWTo+lZoNMUZCMm+bihiqiYuMHXG69Bd1gIzbsgDs5qzcsRgi8oUwgH
         d0Hfcq0SAJp2tB3Jn8sn48NUr2dMGzgmopN+/xZUKIyjZwHB0RgnzfvqaZnKmvI3gNJD
         yrvapicHlC2G2ObzOk7efa9ykT/KvzWqgcxsBO97pqEiCzUss4aRaWbroWwbmTnSoMgn
         VkeDIvFhCs7Om+nvrqBLTjqmHBXBwh4oW8eKpDCOGWs+px/LHvif+JNrxtAYvnFl0FCW
         DKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xBitHOg7u9wnE4xQQWBDM6Pk6MUfL6a2g74DT98eTmk=;
        fh=5yNL5wCLtDnFkgOgiUExWoSMI0Kf0ZHpdcfYErVR3D4=;
        b=TUReYrqE4UbypmXciWki21JPVu075kkN9uio0RhdBVxHr0Rqou8R3D7lfa4OCPlGzR
         us8FfUoK0+CVYjdc/b/CUJeDrbvAhTFzlI0YxHTKRos0In/UXq/fDGBkOlEOfoULIQ9N
         +GV7CDnmkW35yIt5oN2RE56kjXB9hJqaM/Jsd9Df0DFgxVtl7wwocjp2kf9D9Esd4kQo
         fFEBNkCFrKxT6VENLsineYP7h8nB8qW5ap2YIaKVBbVWBVDRyS36bVQcj8GHEDyUonGj
         ZMADckA/g1s+oqzCZHxKN7Fu65d45e3gvbn79Z4G46X/yemJIRyJGjMCyMyou1b/5c6N
         as6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781601365; x=1782206165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBitHOg7u9wnE4xQQWBDM6Pk6MUfL6a2g74DT98eTmk=;
        b=HobfYZQRsLIXVaGSTySC2sAx2F4IwzGIh7O3pe4EEyylwdOvqcU7jd30NIjg2aCESC
         +Ug/ZG8+DS40PDWy7en0Xdll80NvU2cmKb0087s3hdrMkOpul+7gCBz9dQkAdawtwu0y
         mMcVTzHZZFqjMZkplfScpN5pFqjBzBtSBGC3Ju8wGNfDG9cbxI4XoCoKD1QRBDFqiPw/
         skixA9KJSC3IZXplGOI6GjVeZCSjai77rb4I86LliyIJspgEsmS3ew4NyvUu2O/5qyE3
         nihJ17KSkb/reMOmcwFRF2ir2l5Tq4s7D9iLDaLGyNV3M0ziOUH0MboMImgJyeUcg1FD
         eO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601365; x=1782206165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBitHOg7u9wnE4xQQWBDM6Pk6MUfL6a2g74DT98eTmk=;
        b=kUZpqS9Uo2t5C/fSa9qVuNCYRhzD4w2wTu+AXPgra/xcY0bA6ChFm8oKnZ3ZBt0eA4
         guMwtchs/BlB2tSaiVPeu5Ex5ROydExnbsoPMdrWegNHyEJq+xf7uOS1+gDbjXD7FkPt
         iL37jplwWOoBI+3FAVt02ibsBuCC3rWJAiFP5rYQxhzd69UlpPe6O4ByZUUzYuw+4GOu
         w8WkF5Hzpmm1B06jqIlzfbUtGQicsXT5YohBPWR/5M42KYP+gyrBVSaeh3NiyFGFtjQm
         Y/Fk4ORbv4DN0o66FxbwtQdth73zR8iteSyXipzq2GOv8K9TYCvNWVx/qzkGmbaCbAET
         Jkqg==
X-Forwarded-Encrypted: i=1; AFNElJ+2oUOcZGxslRYzZl+z5eviyhke2tN8i0mSLRqh1jLahLqiv3kOMZuxAGetZw70RYyf1pvRZq7Akr4mch70tlLEoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0wFRZIRFe0Kxx62e6oSYWY3J9/KTL6L3ajXCIl3xv3hXuZpo
	i6eVWNTEN/r2qjynCa2PAOVWH12zNebk7ik9sjXWbOwuTesUY9O57mEBg6mpYvsICUMb6l/n6lO
	jHkNyE2QK1kxYrVm4KQrNIX9aaRF2XNQ=
X-Gm-Gg: Acq92OEK0udTusxCWfhY4KSOKOomkh9Nijn4tZye82SwkY+tOyL8t8wf1gwO6+AUyLn
	2wZgikSrPFwVDhyUifnZBbXQXmcqZJR9JLrR84ehoKiPA/fKqLe0AuSsQRb8Rk0kIFbqZf91SdN
	dYW6JwJo9ob2OQTe3qkW4NsAInGemQWuEHc9avkU06LcTbGfz4LrOOj2PQTI0lzcdTH6AA1VF8+
	xOT7FfK5qpVZPVI3OHQv4+xRu1FsKSfMkicJkcF7DwhJbB/vKJHT4VHJmkf+cj7NQK3I6PxXohX
	bZ5w5uNn8PYwbJxvh8ba+Iu0TSMQahZ7AATAmUfnRt2/p5kSc2QBMQRSztsSHF1tlI8x6g==
X-Received: by 2002:a05:6000:43d4:10b0:460:5a6f:c0df with SMTP id
 ffacd0b85a97d-4619f3afb82mr3818724f8f.22.1781601364870; Tue, 16 Jun 2026
 02:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org> <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 16 Jun 2026 10:15:38 +0100
X-Gm-Features: AVVi8Cfu8grPDvba7LPY_s1hYKwCvRu-3RFfsYcXQOlgXI-kPpT8Abiw8ZDPVCE
Message-ID: <CA+V-a8ugQ=GwWfJWdXDF9GzJGUjVWNoS5gc7_rdM_Tk2rt58bw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34059-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,chromium.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1E0E68D6F7

On Wed, Jun 10, 2026 at 5:28=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The variable has been previously removed but not its kerneldoc.
>
> Also remove the leftover reference to state in the description of qlock.
>
> This patch fixes the following warning:
>
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'
>
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
>  1 file changed, 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drive=
rs/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..b426bc7898bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
>   * @scratch_phys:      physical address of the scratch buffer
>   *
>   * @qlock:             protects @queue_buf, @buf_list, @sequence
> - *                     @state
>   * @queue_buf:         Keeps track of buffers given to HW slot
>   * @buf_list:          list of queued buffers
>   * @sequence:          V4L2 buffers sequence number
> - * @state:             keeps track of operation state
>   *
>   * @format:            active V4L2 pixel format
>   */
>
> --
> 2.54.0.1099.g489fc7bff1-goog
>
>

