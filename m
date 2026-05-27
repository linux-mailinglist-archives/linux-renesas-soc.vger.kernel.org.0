Return-Path: <linux-renesas-soc+bounces-33226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LoEM3kXF2px3wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:10:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC05E77F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 806E930777FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 16:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41AA033B6C8;
	Wed, 27 May 2026 16:03:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51537F721
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897796; cv=none; b=J3kvInHuPofdeDNkEHUxYPxcsFRWEUQwH/vwdcWAamG/IIByjzACa4iMHAlVmTnIa78PhdzxvOsruDK9Uf7xglkZ2fCJhfxSFozSI5i8mRbVTr/JrDXFLhi8C2ns+UKQZP/nbl2wQKAOYmgPwA1pOG7Ew9pT/l+r1Jb42AFOc7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897796; c=relaxed/simple;
	bh=PdnwddvyWIarHDQaUbeQPvHrwPNXjHSw1fY7F092KIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAmmnLm90j14PK2Xd61fCH468ZkatMR70PxyDhIZtA7FiSVCX8r9Oz5Zn8N/5aeetjMFU9j1u3gY4BXJpTC9Id5D8dpBpXMhKqahx4K5OFTb2DzDKVr+zt5cLqdJM6cnUrQcM9lR0fkcTW3ZIsI5a3vsEHOGJoO0g9wNFSntezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57513ac61f0so3893605e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897794; x=1780502594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAaNLENh575JywEtLAJ71L7KgO/CYiuJ4uJtK5tYZkU=;
        b=HlwsbVBPg3mAW6NSi5CWZY5ktWRDHSPYzHy564r2sZ3aAkEbWgwiBLIOn1dOxdmo7N
         j3ZmIp6q/1aA9bEoCBDMWGkaR6CaXKwKrTYy9igXO5HNtDEdDwwWUWKBqNCZBi7MkrmR
         VG6xB+DtMpwmB0Vfzg16V37JTq+QzPhL7ngRmiWTX6Z7XflIWfwtezrKkCUtdMmKR9vD
         K7w+UgCtsNBc2d4CCKo+p65j5VDSHq1yZUre3xJWHeWVYCHgsnMI4Ydgh9jgtKHDV8BF
         Ty9HrcQFIkrHljdwn0uhTDBJVdHWpSRT3fndkcVSxpoLDSCj7H8NgZhTyxG9rfzxeiiV
         jRTw==
X-Forwarded-Encrypted: i=1; AFNElJ9bXmciMZKDkjYmQLdI9oXa0wMGYdWimf/j1uP+Q1ewOcHPlirGrx6rO2rVVTRQYPc0wC80/oTo2VtVyiu4GorqSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rvgRaGHdr9kXyu6fduWfThG685WfVbxhydb/5Wb2jkFWmfqE
	PtqmsowqdG9nFVsRGI0LWNvajo1dMuLJtTc/H/mQXdD9r5i8uxI48c2beVrSLEczcNA=
X-Gm-Gg: Acq92OG5xKY2tGO5CoLojPi23TZqb1wgUockt3VurZZcDSHpXevsTz4j0Ma13/h/I1i
	WCTnazLuKhvdn3U38MECwx3eufiVav6RkL6c6020dJXVpR6tsheG6bT2Cb+SaLFdeRucyPwXLr4
	WfS+DdoE+xwMfwm7AnB/+rlH8jZwW8KxvdqjjopZumgTBbsDqoaSNma72MeEoQGD62oKastOJ4I
	CbpLh64Bg5N2FsKdp0WYZeQVQSSQPaJSkJeSfWBeBV4zosVhgzOMz8ROixVGmtepJFFZ5avu3HH
	S3q2aKs1+2Xd18hFFqnlHYTkhNzEso11UhAlJ/NGEfKNef5VoQ9zicwgVfo+5jzxPLPWwDOLhA/
	2gT6LTXQ37W+fJWMUgbgKaEK0jQc1ckUBBQeyRrCaqRx+GjDTybSiRLGpe6ElFE5M0+7U9dwBlO
	1hQ4NoarH0VVmjlkI+boo/6GNrKBg7O/Eb7TEltUqRbpw0v55G14KabeL2iQ86vJF+B9USiu7MQ
	48=
X-Received: by 2002:a05:6122:4587:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-58662daadb2mr12430171e0c.9.1779897786554;
        Wed, 27 May 2026 09:03:06 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm21879113e0c.16.2026.05.27.09.03.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:03:05 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575124e716fso4147231e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eSVl5rzCw/Wjj/lyP7gt0c7zz1x3/uN4Iz9ClRu1hov5ZeVursH7uHEW9wO/0SkcEZn+VTuWIRPGZzoSEKKqQ8g==@vger.kernel.org
X-Received: by 2002:a05:6123:64:b0:56e:f876:5626 with SMTP id
 71dfb90a1353d-5865fc02fc9mr11570394e0c.5.1779897785220; Wed, 27 May 2026
 09:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:02:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsMqVd2qt43hTD0Umt_dp50-yx-kH3126599eNwzfbmw@mail.gmail.com>
X-Gm-Features: AVHnY4KZgFHip0uxha3AkuoFhevCBIRNlRrLf8N0236y4Jx9cgWcXOHqi2SlBso
Message-ID: <CAMuHMdXsMqVd2qt43hTD0Umt_dp50-yx-kH3126599eNwzfbmw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r9a08g046: Add SSI support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33226-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 36EC05E77F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SSI{0,1,2,3} nodes to RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

