Return-Path: <linux-renesas-soc+bounces-31219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL5MDPxJ3GnCOwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 03:42:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AA53E6AFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 03:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C01D330056F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 01:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7DC211A28;
	Mon, 13 Apr 2026 01:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDEdxmmq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D328820299B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044537; cv=pass; b=g+qIZa2x1zcEpvRt94y8cMMjfu5HqglXUxe0E2BxIcv4EB5uNUqPxNVfdl1L6s8Ya5jLSWczz07aZHkIHiLDaoWHsxXti9cc0P3peIh9/+7dTmIaUudflUZKGVwq/x25jQmcOOZH5jWTK09kSRe206Yi9pcalP2kiRmxnn9RWfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044537; c=relaxed/simple;
	bh=/FSqSnQeINmteu8+ea5Qul20IdxOS5foqY6VbNH9fe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDGr0FIUUpqJiSKNKQ0IRD//UybTTXXcoeDFXti3N3tnRQ6CAHfvxGuB1tMUBqhIxpa+potUkb7LFaN/V1qDQwRigQPA9HtJ1pB7ZrJbx1nzHtXru55+49SZwPEo2RT1HryWnz+Il6/xDl24pbjXITS32qGBjLCuVjltlchF6r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDEdxmmq; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4648447e29bso997148b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 18:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044535; cv=none;
        d=google.com; s=arc-20240605;
        b=LC2Ui9I7YC4C32N/zq5g/oSMOYMhWms0tfbruBaVDds82u+aYRevuymm0XVZlfx5cN
         UjSbOtxpeg1Mggj9ON7IGffS8MfYwvegkVwJNWCdHUWOv6X8bYyBkb8yQIImyShiDABf
         +BnyACmRQpn4iaVFvdqa+xbe1bMWQ7BQiyyt1LA6i76QKXbkggqVLW0gPXPGV/Ou4heu
         D2JeJQJqzODKmbsB8gNDxi6dDNbnVCYpTvFrdJa4htH9fpiFzVGuzWgCXL8wtyX5mlnu
         u0gTTc2nK7VHpgTcdnBvxln8J+Rd6sraduCssT3kNamKDGjCVvo25rzPJehluAanXCd6
         SCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3JWatNzIwzqmksxxblnP/lR58BvW+uVxWJcrDNGEME=;
        fh=+qG9bqbhpN0pk8H3MuRzmQS+CehDz4n8+R9J4GRSp/0=;
        b=FZRP5U+u4U17YfQgvMjBnbE00udbkUFGMs+/mBmb1S/ir8rKRW1Et7NLBM/ojRFiTP
         UqYJA0KR15jp1yuFizzuE3/flVRhgug0yyLVQK379IMyR9YekFY3k4lRdJ/y9ctHBdiZ
         DjCiCsLr/hs6SPr+DwSqjHoNLsuNlvrysAz5Mmah9M/II2ykQXLRwWvOQ7KH7l7oszYG
         nv68DcJYWlE7o6cTiT2B1V2ouwvqIRfeN3F4klpiJ/kwIZ4SVuFTcUUNlAG2pHM6l8cD
         m3hjhVdpCiDksid2/BGVJ7CT4NCXwYSfqveNisZXnCxojFxtd0LANasQNMXa5/dJAdQz
         SEsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044535; x=1776649335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3JWatNzIwzqmksxxblnP/lR58BvW+uVxWJcrDNGEME=;
        b=GDEdxmmqnSTMy43XnXhRbiDzMsA+MwJ8kw/DPqUCiO2ofp/+B6c19IVW0RKT23OZ62
         R9U0gqdK6r72rztLTjTzw1lnDJgQtq90X4InwQWNj5sfKYrQGOlKo/1O0wLjwVVTGQEG
         r9hIvWndzOK6g0xTfVbTnhWsdHr8EFaiIjI5ML+qDu1Hde3vjNOxzsf9vuVxqiDZ1lPO
         WUIhx+lLM3MbmtTGoXGyfaqKAU4uzB1+ma1Hphio9I8vAM3aD9Yjak2gFrkS2DOwON7K
         U0fiJS7TeruUEqyMZiFJW+Yup5ruLTL0m80hnq/pQH2SMsFrbpQXKF4oHknzwKeuMJjv
         LXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044535; x=1776649335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3JWatNzIwzqmksxxblnP/lR58BvW+uVxWJcrDNGEME=;
        b=J/G50M4U8B7K/VIri41c3TA9MNRACHi2b234Yg/OaWENLkX7AE0uAYD391fv/0mcpx
         AfQDr+uTnlTjnYcbseFu3ZBnFM/Iz8M6Is/3z1svLMy9lcXqRICcxSjrYtIPF1LXocoC
         LnyKdzBc3lt0tagmTf/G7KutgmCbsJfueplqHEaEFjIV+xLlBCnVNXpN/BneMfBBb92O
         nItnYmhUVlLHTVBHhgj3w6EpurK6XFNaG+FcCbZsacf2F3mC1ajhnYeMFZxcdCTuAthS
         dk/AAqg7kFRYvVElUZqVaHuQzHCnu9lZhRP3Z30lGWmljdu9oRrc0NP81YFSo8UT+Dh+
         ylUQ==
X-Gm-Message-State: AOJu0YxCpi9c2dY96Zf/YdTSuenLCJpWPPe/gnamkGpNY4oj1J2vHfum
	nXukMiFOtukgEGXTmGtI+ijvWr9TEl1+KwgCRm6y84rlSa2UMXYgxElYddEyrYYANH5yd+YofhT
	xxDneeuEjuEuXk5lxGD/U0FcBrt9yHlU=
X-Gm-Gg: AeBDieslfVAqg5gYKD3izNr2B9DBfNUCh0Zm0sKaC2fXXqDIXFap0pVg+Jwa3tafUfR
	2SG601eWZEygVqGgB2k37Ax1je6PzoosWjvcEZlrzWwoyHfz6rvBZXp9qBF4tsiDyTNosAsq7oS
	MYOgeEEGipgeZbpBtPfYysY3LLmZN3HJ3qbRkRdCbF2bQNZnU0dPhaXzR0zlWv+zRKmHFkC5J7b
	xHr+V4+0BCOPmNa5bT8B4YPNdopW17iME9rPGsnJngpFEClkfWGg4FXn2qTInKfRIKqmQ/NztAN
	kYR+SfVZ6QeZa9F/fHY=
X-Received: by 2002:a05:6808:5188:b0:467:70c:a7d1 with SMTP id
 5614622812f47-4789e71c562mr5851945b6e.27.1776044534747; Sun, 12 Apr 2026
 18:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410125556.39607-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260410125556.39607-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Apr 2026 20:42:03 -0500
X-Gm-Features: AQROBzCctlTuy5J2Xol-SMlBfcK8ZulGaEpoOlprecgFP7FPkV5hrYNePsWOQkc
Message-ID: <CABb+yY0au+iRvbDmqf_fEzRTTGXZAVF2jwz1BaccZtkvrBgP7A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mailbox-test: free channels on probe error
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-31219-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 84AA53E6AFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 7:56=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On probe error, free the previously obtained channels. This not only
> prevents a leak, but also UAF scenarios because the client structure
> will be removed nonetheless because it was allocated with devm.
>
> Link: https://sashiko.dev/#/patchset/20260327151217.5327-2-wsa%2Brenesas%=
40sang-engineering.com
> Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox =
Controllers")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This fixes an issue spotted by Sashiko while reviewing a previous patch.
> I confirmed the UAF by hacking some error injection to the drivers.
>
>  drivers/mailbox/mailbox-test.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-tes=
t.c
> index 058c0fe4b9c2..e7cae11780c3 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -409,18 +409,27 @@ static int mbox_test_probe(struct platform_device *=
pdev)
>         if (tdev->rx_channel) {
>                 tdev->rx_buffer =3D devm_kzalloc(&pdev->dev,
>                                                MBOX_MAX_MSG_LEN, GFP_KERN=
EL);
> -               if (!tdev->rx_buffer)
> -                       return -ENOMEM;
> +               if (!tdev->rx_buffer) {
> +                       ret =3D -ENOMEM;
> +                       goto err_unreg_chan;
> +               }
>         }
>
>         ret =3D mbox_test_add_debugfs(pdev, tdev);
>         if (ret)
> -               return ret;
> +               goto err_unreg_chan;
>
>         init_waitqueue_head(&tdev->waitq);
>         dev_info(&pdev->dev, "Successfully registered\n");
>
>         return 0;
> +
> + err_unreg_chan:
> +       if (tdev->tx_channel)
> +               mbox_free_channel(tdev->tx_channel);
> +       if (tdev->rx_channel)
> +               mbox_free_channel(tdev->rx_channel);
> +       return ret;
>  }
>
>  static void mbox_test_remove(struct platform_device *pdev)
> --
> 2.51.0
>
With trivial cosmetic changes  s/err_unreg_chan/err_free_chans/
Applied to mailbox/for-next
Thanks
Jassi

