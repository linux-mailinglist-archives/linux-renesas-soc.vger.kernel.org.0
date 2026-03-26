Return-Path: <linux-renesas-soc+bounces-30353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL3NCGA8xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:02:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472E336735
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1FF830137BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ADD2DA769;
	Thu, 26 Mar 2026 13:54:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F530216D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533246; cv=none; b=RDC0jw5XWzcqu21BT/8Dd6R6QmxYEOD8DaEekCdtB90UV12Q+E0BvlYZqsh9cSs2mBrNW/YpF+Iz8llCIoOJ5C2oaKQe2A5SAIwqcXs+uBgVzNJDFMOmrkJrVrVZ+HX8qdD2IBvdSPytH//3bTAa50vhxCHHr2XRCxYBg1L4tYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533246; c=relaxed/simple;
	bh=b16+BSqdwlKxZBrsPvrCeqq7HQ5axnaRp8F/iq1oASM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrMBcHdBv9uKTqzc0iATgOhNDT/a3rcoIhD77qwDzCaJKUDzgXE593ONrAzMcq5ilF/c80MV2soBoAUNCq6uVIw0Sty/xwDFuhleLuGYitJM20I0h2ir5CBlJyzXR3OdtHlsxPrSvQ1QWc56wmG3tNxZih0Rvxr9A8nLOU9K9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso472535e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533244; x=1775138044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPgufzjj/8gFlVMbLfwFgxSo/amYWDhD7/KxZ1lJMuY=;
        b=CnvEMtVt3Z9Xnxa4Tuc9heSO9MW3Ekbk4hZApIBVdklBx5/dwKsKwvP2Ch3HIJGtSa
         f0NwsOALh1zSl/3V6byxMl5QqMGmPEqIiu4G2igrzOpbPskcqATWZMoeCQQ00aTr8zuL
         +x/RhXcBzJyQq2K3y0InEA+u3FeKB9PE57+JJiCohYXw5NKrq0iXJEYKhLJNB8RYrhp6
         YSr30igPdDzKgYtcn+wzbuDaq6uG8FRau8cRH1bteTHpOqFWFEcrTVlu2qnyZpSq4/gE
         PmVUXdG1rIkT4vdGY9QsNZ1gee6GxjpVQnsa5Y9WSQYGcDXlfRWpA74PsRz+m7adwJhB
         GdAA==
X-Forwarded-Encrypted: i=1; AJvYcCUJsBUoBS1OuEGn2fBtbpOdnvXQgIh4fiO26yMuwFOnjAKal6nLkJldbzOhAxHCd9G+KL/ndOdzgFKmOWsF4PpHbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJKpG//euK7JCTWwvGT3EEZJJK+ji9DvBLcD2pWVQROopW14S
	LpYZ4BEwlbAIZoecOx/2pMgITPZ2qVR3TWBAeaAp1krJ/7HoAkXifYIx0FbGHTPi1kk=
X-Gm-Gg: ATEYQzz4IRIAx09bjEGQd1/FfRjirFbUfWBJjOLDpZKQMtsmkvog54o5i+NZIwbQDdy
	Kj1RG0uvz6KyNGh95Lmz4FP/MwIJ1V9zJBN5acoqQNPJ8jmw9IKT4bq9+MGgDybbYYUdwL2lMr/
	5MV+AetZxb1OgI/4AUVZi6bSyAYTARROkBBmyLS82TT0bu6GS39gA6T9mNXNJpupjunWBlz2Y3i
	KXydJ8OKxXJqyCHvSFNlUSk9reKwOYmEN2YtZlFlla030kh7hEilESpgMI3NJBVTvoJbgh5qOzH
	F8EUQYyP0rUqY8suPlrMrv9RMMkbaNLU12aPHk4omhqqbfe9PBhFaFEML2zN0/3Eq7ARkYtKrGE
	7LLK16Itjourddh6bOd8ZlQqL73Lwwz7nvk5UeNntt0yap5oYUWPTrCs5Qk7JV7VLHs+BuDlrqX
	gvsY/1yNpnUMGOD+Mk/mptVCkbRWvqb05HZEWGewiwMfgMwiDx2fGENeJWt0hLtAp9yqXrXZs=
X-Received: by 2002:a05:6122:da3:b0:56c:ca50:e963 with SMTP id 71dfb90a1353d-56d220c58b3mr3765454e0c.14.1774533244294;
        Thu, 26 Mar 2026 06:54:04 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d394fcsm4236985e0c.12.2026.03.26.06.54.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:54:02 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so318893137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:54:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIWDnclAVhtt7xgiMFeDpB6L94rF6FpoAreSdqIkqJbBIy7lbOOuqZS4RHTsWrdCzKhK8+4lreBC+oay7/cdoT/A==@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:602:71a7:63c2 with SMTP id
 ada2fe7eead31-603872883d4mr3233233137.23.1774533242461; Thu, 26 Mar 2026
 06:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:53:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTOZbrL2qaL1yTjByXqFD7-bDfB=9tj5v39THPapFHqg@mail.gmail.com>
X-Gm-Features: AQROBzC5DZ2dGbpREwOcqTdD2PAJeG6c74VA05uhYgFpR_8VB7C_frMsrRmWAiE
Message-ID: <CAMuHMdWTOZbrL2qaL1yTjByXqFD7-bDfB=9tj5v39THPapFHqg@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30353-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 8472E336735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial DTSI for the RZ/G3L SoC.
> The files in this commit have the following meaning:
>   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
>   - r9a08g046l48.dtsi: RZ/G3L R9A08G046L48 SoC-specific parts
>
> Add placeholders to reuse the code for the Renesas SMARC II carrier
> board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

