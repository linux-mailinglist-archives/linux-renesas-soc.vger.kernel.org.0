Return-Path: <linux-renesas-soc+bounces-32257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM0gAU65/GkqTAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:09:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 066744EBDAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 18:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88C6430269AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 16:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBCB3B895E;
	Thu,  7 May 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ulo3cTsF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0233B8BD8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169792; cv=pass; b=SsxlSLaSUrDyboN+8xWJZ9sztI9AfHaf+qsun5QnUlYn3NReorkd6/vGY5Wq2sNoX+RF4NvfTj08WmdxRS15eJF+sFn4C7ey1qNufWtpE9YQL8J2cVGBTt5KIIQkG2G1CaKmfZNB3+iM5zsAhB5xqdbHtyoU0PucOMpdLjSfapc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169792; c=relaxed/simple;
	bh=CEhvezj9XUvsQzprwkB8A9BTXN2jjrQ9THtR9Owth/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eo608YfDqmQXoAgB/n47MaNlCT0G4zIskte7mS28nudKjz7u+WaQ0jEmJC5zkXkITR2DErAmRT74KqfdiIgFr0N8OEh6P3MBCdcILHyW50YfPJs+iNUZ0PajcySRGJMJsFEYY0rbT9rwDfLOEG6SJtSrG9z1Tq/5BgifKlSWVrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ulo3cTsF; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso991373e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 09:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778169790; cv=none;
        d=google.com; s=arc-20240605;
        b=IeEQ9oQmlSxk0Kxn/EGvvB2vJPjM1sDoG1ojMezGEtXi4h5+T5IkXPZV46SuVTFzrz
         7nFHW9GGTyk2vWKLfWinCOcD2RMUY90rSneTHANRC1KGr1xlRkQNqD7akgSM3Wwq3tSz
         VOySVvQ+8HycVlDZ/E+/04xkKHJymor9RbnmvBM3VEK0Gkhq7MbppCooGHY+tNe4FC7t
         ESknzeNGmonEOQYKa8W3gNrDmnif7EAHWtFyMh+WfSq/qweQv4qujhc/Kxf08WCZcGkC
         TSgxCJUuQPjTxZCntMOEyd5PIySwNKl9WMuDhTEaOEojDyxh/vza19B3sSKZ5g0po2i3
         zPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kSXScqi0MCR7jDi6r5iGbgrFKyoI44KBhr9uakdnSD0=;
        fh=L8NWXLKuWDQWiXpTmzmzD/WGAtMera4MYZpC6UKNLjE=;
        b=lv3Hq9RbxlxIOgp86BURgtIW3AvYSywXztjS4QWLa7WzDFCUFZKvnhMUA4c7jy1pCN
         /iLeEfS2suv0AVbVaZ/Rn3p3sHbcenolNC+yRLkThrrOdx80r6fAmYEBL8QdseU3RaSp
         TILQojv92Z/0PVS8vvZXmre51YuW7snP6sqsPVW3liooIXM5AJKlMb2/jc4wXLu8LbYc
         7UByrkRY/G5+SA78x3FCg7Oz2Mr1Yyi/tHdznFZb0mKu+mtbgK0FlrkZ8AvIiKsERrBp
         FYzt5F/WL0SmpukO8GEZHAabBk5zLgB+DlyZUylO5oCpcAYpU1fww3ZEC/o3YZrUogDb
         nFGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169790; x=1778774590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSXScqi0MCR7jDi6r5iGbgrFKyoI44KBhr9uakdnSD0=;
        b=Ulo3cTsFhXEtuUnJ1bw6tsXQJ4DENHg4HrLlapLRNqJgrmAteJ2ADtTGGSMjCZrS2V
         w9FAkB4nSkhT67TF8RR9PlNF3bUBqA6nS2k/ems5hYDBidyna9wdzdQe5AlWk+44EQ8U
         aAjd2hgntzfmqFywiZNXYaSXP7zgib8x0CD1NzFyBMjFLfasonO0pxQ/YVizSr85nhLZ
         fDZRaxHKaHo+msRlyDCchMjBNMuDVRk0g+mDvYcFmlb3/53qLPLJhxeD3UfGFD2wQ5Qu
         OPEGYDsrNADmC83BzN0lB6AXCipxYumAG68bVauD9+3jj05TWO/o8+zx7B6etqfG01l/
         3DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169790; x=1778774590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSXScqi0MCR7jDi6r5iGbgrFKyoI44KBhr9uakdnSD0=;
        b=P2o4c0B8vnhtnQex1I+v9ZywZ9cPVq7xNdcqbdUebKC/UmtjUW0w9I81gYzk6osfFZ
         f+NcWtwHSyho4AiSxuECiZ5wTrRdzmc+L8VCwsGDxYqyIq0ascBbbMNJsdIPvOVnFfPU
         hC9AS5CCyFcqUFbVkvo0ejcfETV3zgWu9bwPP5v6nnJ8yj1A7COyrN106Zq1o8SkF1QN
         NWe2h5P2xHL16mSzq2YyOebnhY5+4Jxg/z+sJFvFFsjkmOMXETZ3QjTGgeRLBS89wuti
         7EiaHhwmoCKUczUnnWS6ZxWAisf8l8kpaT7qpXDLvVNsSyDc88xPbOrJoxjUqHj+7rsQ
         aUEw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZUjQbRUwko5vP4RCCCxedAWT7E/wEjXeJ/Lv1G8pNx3Vrt9TklY9Bw1jadjno7FhGwPKwfRZ86G2NLc+vFT68Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yqA+L9AHqhl6I8iCZJ1COK1ngw7AYLMaDedDBYsXsWbyzpAP
	DPXvcLZLT2Uex9y0xSzR+pzJcJhYaxFMez6kZQRAmGLlS7ee1+4zq2vDwgxpgvLqY6762UR7xpo
	3/KAAFQxyktULqI8tpNsk9Qyxe4OAMi7AZo0PCEE=
X-Gm-Gg: AeBDietV1nk0xvV4alL6EvwJVMU77xtDSghx/ee9rG2crAxTaLc0tpw7FM5DwOESjYG
	hC2yWSHA0S/ukNThRAnX/cfwnuBqukRuQnnLEZC7ggDCiohHCT+qC91kZs/kHPYyT/MTrAz4mhe
	cFguQovOuA6CDjRk/jYPlxzPnddsPdz2a8vb/QgeNYOKoCRiMHeoXrPSE3sZBra02HspVCme+fZ
	tUTnQM0rAGW+KTFAHKuxIqVtcAh5NHgsrtALmXucwEbnffuU+xPVnF6MB6OPUzSdfz5zfsAI194
	H8P6xry9UmT7h2wPBeQPLgLh1eVj2NvQMdevhqJxO4zZTz+j6s54XrWTR49bmZ1zCAm7wg==
X-Received: by 2002:a17:906:9fcc:b0:bbe:7709:5a8c with SMTP id
 a640c23a62f3a-bc56ac3700amr483762566b.1.1778169712056; Thu, 07 May 2026
 09:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260506215650.1897177-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260506215650.1897177-2-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:01:25 +0100
X-Gm-Features: AVHnY4JAgm7pFZJtm-HLuXQ0MLjv1zwhY7Qw5YYwBrvyZIESDCz-x-IW0ECt4q4
Message-ID: <CA+V-a8vXBPhvpC6hSKykBUdpLm5dJ4oBEWERsKWY46HN4JFtUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Revert "media: renesas: vsp1: Initialize format on
 all pads"
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 066744EBDAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32257-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 11:00=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> This reverts commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6.
>
> The change to format initialization, along with the change to format
> propagation in the BRx in commit 937f3e6b51f1 ("media: renesas: vsp1:
> brx: Fix format propagation"), broke configuration of the DRM pipeline.
> Revert it to fix the regression.
>
> The original commit was meant to fix a v4l2-compliance failure, with no
> known userspace applications being affected beside test tools. Reverting
> is the simplest option, a more comprehensive fix can be developed (and
> tested more thoroughly) later.
>
> Fixes: 133ac42af0a1 ("media: renesas: vsp1: Initialize format on all pads=
")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/=
T2H
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/=
media/platform/renesas/vsp1/vsp1_entity.c
> index 1dad9589768c..839b75b62ceb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -380,7 +380,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev =
*subdev,
>         unsigned int pad;
>
>         /* Initialize all pad formats with default values. */
> -       for (pad =3D 0; pad < subdev->entity.num_pads; ++pad) {
> +       for (pad =3D 0; pad < subdev->entity.num_pads - 1; ++pad) {
>                 struct v4l2_subdev_format format =3D {
>                         .pad =3D pad,
>                         .which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY
> --
> Regards,
>
> Laurent Pinchart
>
>

