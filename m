Return-Path: <linux-renesas-soc+bounces-31376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GIoDz/f42niLwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 21:45:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93E422222
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 21:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 650E03033FAA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 19:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ED433B6E1;
	Sat, 18 Apr 2026 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKObcLAS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271C2D5937
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776541455; cv=pass; b=bnR19KiJevwTFnXWcEeE+s16SfFivqImJ8aGi7wgaUhAeQiW2/t4v5mTrCcl2bQVlrRW+NTNSZcat1u5+gBnTmIjJF3NmJXkntR7KuOApxNHRQ8ATm2oWjGQ/RW9egB00ggiMH5sE6zWcWKF7oyV16yiR89p6wNDA9fKpkXoKJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776541455; c=relaxed/simple;
	bh=f5yeFodhb13tmRy3lI9F94Wc/V2SYX2ixJSVbq11ZCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/k5/dAA2yPV1Ovobw+DNugZG3Rryt/DxJA4e6V4Qk4WRdRs9loh9AJvs4RC7ZC9De0mYnSFu2x34Z1kGiOIOKxlGiqtyyDRQlg9z6QgH7qD3DS4sOz/Iofr9jVArUjC2DL/WnzzWg9cB0pTfLG9jp5/WhZsMwZl3qtv4F2NwjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKObcLAS; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-471bf5157d7so833507b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 12:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776541451; cv=none;
        d=google.com; s=arc-20240605;
        b=ZH7MCim4KSDxuzCIZygFRZdW2lp9FeuHUsm4FmhZUf6DpurOVSviCCovEcPGy2SQE4
         0AXcv5CtxFXkqALlo01eSHbHXYwZgfuME5G/eT/nzSloUZzM5I6rmbn8HJv4joH5JUAf
         yvi6WTLXl1WnWR9nVPksHF9a169QKLZbLQY9tQzhp2yhd2oOtgLRjGJSl1Vh6YSkOCxY
         J4qb7wpjnN3AI7FZRq5tlSZXCuXN0Ks9QLwjeUAQWP3JzpT/mJ6JoLP0G6CzvWM+trEV
         MygDc+w0AVNDQop7qX5fDonpB16sMoe4rWx05eUINh/DzVhho50zY0mfRB8GZk8ui5PW
         SFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wCSAbGScGDyMDD/h2yzDorOW8Qy0bHvRwqDHb0OZrp0=;
        fh=0lgohzVhYus/1loUn6XsACkmZO2YIlxO/bnWt1qpc7o=;
        b=TcfjW6UFm6o77+dCKRaSoz10kY2j0x8/7UZb0fZOwKgrzKCQeCBlOIlX3HAcXOmsyW
         K6Cx/IV1DwP85TMgUr7BHh1+fBdno31Exr4FmAKX/dsifRXcyrwXFDqpcaxE1HEeEbKd
         cuaNk7winlxphPwI9vEoAU/SrPx1YjqejDDlXb98kIxlGjjy6xlE20HJAHV8bDOGXdUx
         +vCXyny2Q0DMzF62TnUEBtxxTIE0c6hvSa+KG7A4Uy6wE1hhKO0Lq0Y7rn72BoasKiND
         3NrZnY5DwiFJsyiq6DbHq+M6ZajGUayCWHfRBuvAJJ2+g1s1wr4RsK9ICY6e8iIJuvLd
         xTMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776541451; x=1777146251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCSAbGScGDyMDD/h2yzDorOW8Qy0bHvRwqDHb0OZrp0=;
        b=qKObcLASq1mF140b4/rAHOZJJes3JDr2rZ7zyXKdjkyDSwvBfHj9qkP9hyExFePhVq
         vGiJNX20V4yULPo3Ub2oBt+9dewe+Xi3Y/SK/Zlrc0eRXLjIfkR0eQ3RN7MA5DAw3Nhg
         5mmlKKiSHWMkFeVswlOXssG+3H6Trs9/cEGmvdBT/QamlH8ZrH1UI8j0xZFz339/R+AL
         qWo4osVWfA7kMg9fmz5BbIE6iwnmXHvhWT2Bm+QYIQ3AEZTvDnldoko5LBNShYhqoy4N
         z9+wFley6uBTSLb+3jYZ2AbwLzafBwobtz757oB44LcLwuet9HBohSZhTnuGzUcA0LSt
         OLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776541451; x=1777146251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCSAbGScGDyMDD/h2yzDorOW8Qy0bHvRwqDHb0OZrp0=;
        b=ZOrE5jX1q5aaMiXSR0l5AczlCsG+a0eS4PmToZlwG1qlEC26ta6b8R0UA/guCkDL6Z
         xQNxQ+AF44AoHwA83ubGPcqsh+fMtG0MKL4ctn1IpowXjeA6d/FzDpyEWcLPa0JdA7O9
         8LfuaO3DL3N6+6siHSjeALRN/6d/skZ6VRsJjz8lvoTSnU18jo2r8PP04zU6/4VVKXPj
         GOaQdjz00MkVZDmgnRcGXFwexWTt0GdC8piXq/QGK21bqO9KF6TJsQTwW+a5Gc5ywylf
         94LTF4OjULoUxZBcB9dJvs7Nbu1Sks90SSgMKaGExG57aRh/IFO7pWJMyTi9AyCuqO/A
         PDGw==
X-Gm-Message-State: AOJu0YxpCMLTkjudhTUZRu5uL5CmBomHJzCER7vAbF6ZWL9EaWUi17Ch
	o07PpiLuWsRcGy2CIys0cljvYbRyKCK4MM23eiAMu9A+TU2K9mtBrFYyFXR4shxesia9n/BDh6B
	uqqm7dSUAlRlA18GivWAWolawVRGu506ZiImm
X-Gm-Gg: AeBDiesPpC2uPVhaLB6bE5XuavOYHVQ6yOdpfV97nF45lyE/hPeO28HFRYJJAqNNULu
	WvBeqodLjGUA37f/njZi6HYozlSOoE91WJ1AumvYfd8oxRRcavg7CHIbsaRuLo8ILqgc+7xfX+e
	UghNq0mvAKmYr56Sf38U2ENlJmrJrzEkTmdUo3F3Z3hY1bNUpnNkVRigZ/i+5gwerp1GHxIdsv9
	A0hoRu4P+ailYHgdZiQmXwo7jAqdCjcFoQqtWP6hRmSAvuQ/09aqMLyTHtMQnilVIWAuBBBCWit
	Dx4dNKvRf+Er26nUpLw=
X-Received: by 2002:a05:6808:3447:b0:472:878f:347d with SMTP id
 5614622812f47-4799c9b0523mr4249365b6e.26.1776541451416; Sat, 18 Apr 2026
 12:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260417074237.16053-1-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Apr 2026 14:44:00 -0500
X-Gm-Features: AQROBzDSWBHAHIpXATtXk9Jt977SCIUg-mdxRx8R3np23ZZGUKncTcUwmIdB99w
Message-ID: <CABb+yY0xf7s65_F5=rGgML+BBr1a9AUn+jvSGi5OPcSe_VsFoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] mailbox: mailbox-test: fix issues reported by Sashiko
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31376-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: DC93E422222
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 2:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Changes since v1:
> * added tag to patch 1 (Thanks, Geert!)
> * fixed 'workqueue' typo in commit message to 'waitqueue'
> * added patch 4
>
> There were some more comments to my v1 patch series from Sashiko[1] but
> I will leave it here. I don't use signals so far, so I'll leave that
> part for someone else. And the rest of the comments are somehow valid
> but keeping in mind that this is a debug driver only, some compromises
> can be made. The patches here are worth fixing, though, IMO.
>
> Tested with a Renesas Ironhide board (R-Car X5H).
>
> [1] https://sashiko.dev/#/patchset/20260416114737.36988-1-wsa%2Brenesas%4=
0sang-engineering.com
>
> Wolfram Sang (4):
>   mailbox: mailbox-test: handle channel errors consistently
>   mailbox: mailbox-test: don't free the reused channel
>   mailbox: mailbox-test: initialize struct earlier
>   mailbox: mailbox-test: make data_ready a per-instance variable
>
>  drivers/mailbox/mailbox-test.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

