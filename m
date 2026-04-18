Return-Path: <linux-renesas-soc+bounces-31375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPPBOdXG42mzKgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 20:00:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD2421E89
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 20:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3972A3031AF8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Apr 2026 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBD320468E;
	Sat, 18 Apr 2026 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faaru6Lr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F522339
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776535246; cv=pass; b=oyzbascjnd3bqUOfSHzDHSB0LHI7kS4YSzOFUYfovOpGakg8fz0EEtN/blnI9iSMT9SoxnPIWoQfRgXbxKiX7VXlkjcS0hxNDFJo2oG692HscWkKgnkF5trDIx9LOnsl4c8gvSzV7OQeKIp3D/jtrmCYaKlW0CwdMMady5ZwX5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776535246; c=relaxed/simple;
	bh=jh6gXl8VVnBvCnbQRlj61ge0438wsBnQ2RZYJADqT5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mkdi4dwXkVd9XEvZ6fLcnPEVPEZMDj+bSfpThJDiC4lW0nYrwjtOyTaPW6LHzx9e6AOqnzApSAquKTyZlEunSHzipcteATvnn8vPI2Oi/e9jCInpLZB9aTxklIB37YaVc/SKi+OwRJAYLTBW4IJvHxKCkexm5CXus1xwXFHh8Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faaru6Lr; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbcd61429cso908170a34.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Apr 2026 11:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776535244; cv=none;
        d=google.com; s=arc-20240605;
        b=iVelnQeEzblbCs3/XNek5awWT86fX+qLEkFhg4q4zEcmMdPjBTA1TiAPgSFCPdCpUD
         39Zy5LwVEacQur3qkL7KZGwWu/InewDZ4dHNGkB/X7vrUksca4VLWdpJZ/80w6X7j57i
         nAGJPlWaUDuoYf9mtR5FeBhhVhLA+VoyW/vfcyN+NEjfpFPXa35eULgajneaKklgWUA1
         HcOH2HWwqJGBMunnU4gDZ+drA+rACE94qAF0priPcDZtq3zF7Wt7Z65FKBcw6Xpyt9DU
         nq9AicmGgsnsJN2bAsbQ17FIfYVmygTsumeUN8pAGjJbx33ruTd5tsdNsUiquMLBk8lz
         byFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=snoPbiXU2OF6Z/jkOIJzUF60eGyluKEdSd1oiLvR22I=;
        fh=Nyqr9BkW2wLWUGh3lfzURzuhGuPLfU8+b7do+eKdhmc=;
        b=Qtcxf22Pi3lqeWYTQ63gcHCLP6CktuZP/zAczH1Sy2JIF0d+/vouvrkRfntmCaAk0Y
         w+GpzYAl2KDn2Vr5PkP5AbNYNXYzGvmQ6bnbP18dywLBSJJ0FsUoM8Hc5G2I1jTnGoRU
         XeqJYU8qW+eRaIQwylgxz5Ik8vCPaZa23XrFs0ptYe2gm2NOwuqUiHtg7qDWtjZQmKke
         +DmI1iOamvXe6Hl2Xfi+ZhwQ/8RCt0p2Z3/H89jwiuKay7YIYk06G/7dAXABFBq7HIMA
         EQsYVeFefVe1MIckm0NDeVWk5zyIDN2pU0Knjt86zsjjGQ1Twp+QgpfnwIISLuGNrnlk
         NmyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776535244; x=1777140044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snoPbiXU2OF6Z/jkOIJzUF60eGyluKEdSd1oiLvR22I=;
        b=faaru6Lr3SRBoQoXEAIj2BpvyRTyvLUvGgnFfsEur1o41VniM8jIXaB+PsfDTwJt+a
         78O9yMmC975Jwx/PKP4DNAgedOuCNnbPMiRj+RWOLyv8FSDPhMQZKal9hjIWQ1to+dXL
         CtVwMQp5osBKZKqQMo12OYc6rrNTO8ceFZmZyGiP0d1hkW3OGYmNb7IsoX1m2IUNTTGh
         qkjUF8mfLBxwJtgY1y9Pi1RHin/qvF9H+lM8fpY0caqdpjyc0IHy9biWz52A/jp5XgqT
         ykXhjhPQPlu/dOmxCI6xnK/HfXHbNX/QZ5mIvA0CIPjfV6130/yEH8H8Rt6XdtafcrvQ
         Y9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776535244; x=1777140044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snoPbiXU2OF6Z/jkOIJzUF60eGyluKEdSd1oiLvR22I=;
        b=V5aSpHAs5j6vEzPtOjzErD+LUQwWUfVzBsvixzPBaO8GKju1eKUVOUEU27SgR8kGLa
         7PMLSm4lqKiN1LC2PnbnA9552JdqQAksIRlg9WG+TOnGshIpyqM08XD+Bd3p5Pc1THkM
         MAxx9HPoeJpo6tc7+1ZM2skWbqeXvwATToOZxFPJSfCGt0fn/2WsBJEgA6/2yEdWjsCF
         xNEhPS9CsjLWiWrdDiYDQp/ed/c73J4f3u7RobwPDAcWYo4chqvM//00tTEm8IdZXiUL
         5+23gddX8nigrZdRJlJXnrPXlVoz/WttKJjvks3vIRjnc88dD/fYZzt5lcJhBAERzfH4
         Ek2Q==
X-Gm-Message-State: AOJu0Yx98wXLmqAZEQ7n+Gpd0WG39cbPoEQC87COyQ4yTOp2+Bw0K2yc
	pROKWzdgtyH6YSegEfHOZo5xUIiSblO76LjpCHKjqid0GRfj5w37dWMsp63inpkJAtpPJMELs7Q
	MHBeukfRuq6TY1lKyzPVEvP1m5mBZJxg=
X-Gm-Gg: AeBDieuLMIdsVy+6Fe7HiNxCWDqGg8HaelY6+bzjW14NEH4JgLvXxbJW+4yIOxl4RTv
	oBbVYxOPWjR9AYRU9jnvv8Wa7C05S8DAXpiFXZblLECpT31zH5o+rQ73gkh3HHvo9TaI4Nkw3KS
	E4cGmrsGadAmylSPJBzzCYCyQvh4mmZDp26Ful+yZ8a1zaGHFbjJfddiMKdkbE40c93wL6spLm8
	rEthMpkWucdQ0izzy/GPV/haFjYcwX7N7LdOaX8CVSeuXSebuk3PYO5OsSnBcqxrUyDQ8nIJBWp
	414L5zB0x2gwRVYAyew4MEo8kK2GNw==
X-Received: by 2002:a05:6820:4d0a:b0:688:3372:3a0e with SMTP id
 006d021491bc7-69462f21b61mr4099231eaf.50.1776535243905; Sat, 18 Apr 2026
 11:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com> <20260413104240.30493-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260413104240.30493-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Apr 2026 13:00:31 -0500
X-Gm-Features: AQROBzD5E9z7jbfsZ95ucVxhipvLI-mZBt5eBOOxHrlAbrrGc0ibAYCEtZk3VpM
Message-ID: <CABb+yY0NrmCRu7c3Y0JiahmVCNCq-B57TckQC++X=HY6bL0-sQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: add sanity check for channel array
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31375-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6BBD2421E89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 5:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Fail gracefully if there is no channel array attached to the mailbox
> controller. Otherwise the later dereference will cause an OOPS which
> might not be seen because mailbox controllers might instantiate very
> early. Remove the comment explaining the obvious while here.
>
> Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> On my Renesas R-Car X5H based board, the OOPS was indeed silent. I
> injected the error manually.
>
>  drivers/mailbox/mailbox.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 14d9655d5424..0ed34f8f7556 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -533,8 +533,7 @@ int mbox_controller_register(struct mbox_controller *=
mbox)
>  {
>         int i, txdone;
>
> -       /* Sanity check */
> -       if (!mbox || !mbox->dev || !mbox->ops || !mbox->num_chans)
> +       if (!mbox || !mbox->dev || !mbox->ops || !mbox->chans || !mbox->n=
um_chans)
>                 return -EINVAL;
>
This sounds like a quick suggestion from some AI tool -- looks nice
but doesn't mean much.
Is your controller driver written such that it calls
mbox_controller_register() even if it failed to allocate channels ?
The code already gates access to chans by looking at num_chans. If the
controller sets num_chans to be non-zero, the chans is supposed to
point to an array of channels. NULL is just another garbage value, why
not also check for 0xdeadbabe or 0xffff... ?
I can let loose a claude session and I will find 1000s of such "fixes"
in the kernel.
But since it is here, I am picking it purely as a cosmetic change.
Thanks

