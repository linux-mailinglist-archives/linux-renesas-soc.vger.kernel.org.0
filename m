Return-Path: <linux-renesas-soc+bounces-32367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GdOMZKuAWrXiAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:25:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746EA50BDA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBEBC30053D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6693D6CC3;
	Mon, 11 May 2026 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH4NEwh+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901CA3BB9F8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495118; cv=pass; b=Dh30wqb6i2EeAOrQZ/7lcsy3E6xktnHRMoJ1n8poNa4k9ce4cWNeY11tZ/0ogDR7FmuX3tGso2lFc2JbP8gHxE/Pn2HteAP6xroPp99POc5QELwgGOPep74RBZbNF8B2SvyUo+qnKTTlr6om2sgdTPsTGaOcytDswWMeqBo6c9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495118; c=relaxed/simple;
	bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0H1cny7jbQ4l4hlObhxkJL5MLOI6wecd25OdhbxlI3gbqYea+Jy435axuk20S+XvoF3fPBN313Nw9+bJVzcl5Y+yszzIfIHZTtwRUPkBMaUcdwOf6EaoplswvsG/Bqzxlsojnsqq862bJCCR9lMoQ463q1fhcDfA88f3G0R0v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH4NEwh+; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-366375c4076so1745102a91.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 03:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778495117; cv=none;
        d=google.com; s=arc-20240605;
        b=RqXRLjaKLx/40qFNDOYFgJJbkcTwCutX8iXU63QocWdeOKPCSxuWphulBWfa7FjcKr
         ICAlJ7+WMf5w8sjblw+cpX8VUcTpR3bJvjMOjJ9bjcj15ryaUIsgTgbBjm7xqQ1+KQF+
         uavNCvTT7zqFOqPYh4shaHXoLJHEsCLrCY+J3sgfmrJA24oCBT3GikYJBmkcMc0fMS6d
         /0tCD4fGgdY8gR+7RvbvyK6RzzNQfzAELunD2+4yOPj7OU9HcJPle+ixphNFJIRPmvoO
         BZQpxlsnMGw70GT1H0zJo+TepF1rITbXh0MwcdKcuIL4C+XGKSpkW7FVoZrFwDV3inJj
         U8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        fh=lXBaEOZKu81YyTtEurdGZVrQyrRdxrWuHiqXiitiqTw=;
        b=NapQCNwmr0DUKgskCAfgSLPHuQkRiwc0RcQHiZk3U4amCXGZrs/oCtF1sFmB9VFwhx
         9bJcuG8rJd0JrHd7zRJpSeDXCxScS3sWoDJmsvnwBYJec+PJjyy79PYZHsTPrMIzOGLq
         UuxDpJqQV0hC19MzLkN+LmMhfxPCptvKi4j0oa+24wLODPd8EaZaOTDsE03COLG3cBbN
         RHUhzCSjxYuk5a9Qyjxl81+2FEUfWaOdCba3DPDtMUEPAr9evPnWxlqaYTbRSEPXOh6p
         0ChfnsB7+XM4L5OPgfcmAouKsXrWc7mhYBJVOPrZNeEZr0ML/Rg1PGxynEPUcnhZhvWv
         lLUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778495117; x=1779099917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        b=HH4NEwh+1UCpRaJFe9aySXn8u3SZsRMIKKjbb9ukQVP9nP+V5B2PCU+p+0+Wo6GnGg
         EaSF3hfAkNScQ4cNxXoMu0US6hjeDqLpfGNwxxZf9qUgvzQG4wgepDlkkl6DoV7OGLJr
         DcxzURPZuECKH3mZP0JnlVqIW7CUMbn3qwRTnpuK9XaPLCIh5N1vgLcsnr98NjzAT3Ba
         g8R5KC1eXtqENiyvlkDjcXUdkDXkJbcYLlbDxTAR/wMsDm+TDwfh4D/rUO49q6aWv+g5
         tyhX6oH83OS3xFM+jlvkrWXo7Nl7E8Kqk9fCuAcscfytFSFsZ/NiKzxSdItGXVfO+XQZ
         GWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495117; x=1779099917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vH2RJlYCeOfSYlR5bu7uwY8+vlQvHMHRiMHpKSYXzQE=;
        b=d5+1FnYsQqxg2wDmvhITXDd3wMFemcTCB2fSQoZLgpgYvP+Rw08FGuBwrK9uEUnll9
         mFuOorV/swHvlP81O/2MpNmkJkX1TdQjfv7pfp82PwO+O8pecDRIKxTubGQYx/tpwUBo
         aGWKV7DHOmDTCfwF3lt4pNph3YJa/WlpsLDHAlgqIYWaHMKkmZpySRUv32TUmY57L7PM
         PeNXRpuWy1tIwZx7Vtel+bOfyOzzIH4By1NVWUdByz7n6gx/q+HgfFkDv+yKjXwnbj+e
         wrjPk8h49jM7JwDeoUp9bmhD76xGHvDCStsMjjFXb/1e7YHzuOZNdKE3IeHAVD7SEpDD
         QfWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OM2NAchjOX0hPhpg+aenETlDsJo6UGZF3Ntf+RwamfQ+KqgLnfNLvjCg+0RDcL3v28g+Tu/G2TUuG686Ywhf0Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02YyCelT11vjFgVaPgoR4zDOwZMg3xOKRyGV8BtgGkyag0DhB
	zmTswL/QwU23R8+nP9rSriYw0saAiCXPHpAp4rIJKuEC1Lma1XntmOhUBOqLV50vFWDHuJ4wYwA
	tl9xjRr/RMkB/0l/kC1bE/MgYs3UkbRY=
X-Gm-Gg: Acq92OGKoX+/AtUGukNmCsR/WwbIEVW25WqCzVTwwO4T4H+5gsHgVnBQVhMweoEU6S0
	KrCsLsmK5Q8eNGA94xfniWJ12HPM9uNyxMgTiWR/+CL+oE0VCnoY72Oc3iX9nSUFPKZ6aernynJ
	VwkicLtawM7rrAhVJ89VE9MkNNEo94ChEkJanpDIh18oxCq0RfW2oKEG6aYWxWOzKAxTSP+zVtn
	88XlytdkItqaJN5hRxX54TO4Ta6Gp3ngrFCpCOwvf5zQLfT9cgaF0IySFbuj8L/jXj8upX9bB+d
	BqTlmRJ+8Z+LnfUUNFvb53NQeOeKtBlvFo4Kjg==
X-Received: by 2002:a17:90b:33cb:b0:35c:30a8:32a with SMTP id
 98e67ed59e1d1-367d4704ffdmr9410585a91.9.1778495116902; Mon, 11 May 2026
 03:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-2-phucduc.bui@gmail.com> <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
In-Reply-To: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 17:25:05 +0700
X-Gm-Features: AVHnY4LmMwmb8HoXnC7e475rElbDBQl1aVeOa5zbVkNS2rNSLdK45V-U6OAhPp8
Message-ID: <CAABR9nH6QidCNYfTnkMf2_Mhi56WoYau1fgwxDrkqH43jb=_qA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 746EA50BDA0
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
	TAGGED_FROM(0.00)[bounces-32367-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Geert,

On Mon, May 11, 2026 at 2:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Please drop this tag: it is intended for giving credit to the person
> who suggested the creation of this (full) patch, and not for crediting
> review comments on a previous version.

Thanks for the feedback. I understand the proper usage of the
Suggested-by tag now and will remove it in the v4 patch set.

Best regards,
Phuc

