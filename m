Return-Path: <linux-renesas-soc+bounces-23651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA97C0E654
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2F1427FC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 14:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A088246BB7;
	Mon, 27 Oct 2025 14:14:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655102BE7B4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574440; cv=none; b=YtBnkspc1B7sUAMG9s9tq8it4/pZZy3UXRqNty5dLINHDYRYdsonucjoJNu4jiHpMhaGOcEAWY+SzqUXfGcrcSwhmRVtZ9zj+AhGyzWCa2+zTbd76/yvM9fMNLnPxbCYyFslQJP4pNm1/reCYcXPKRsGpS+joIP/D5VUKiKHkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574440; c=relaxed/simple;
	bh=/4d4HjF1+DuKlFMPzricyRHQOfHfI+zvHpJwBUDOmKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QobpxU2otmxw8CkcgFHisi7TC5TG64sctNFCymaEIDyB9Cx+Ezhm3+27jaVa3EGysiw1XvC8LTyz6tJbxypQFdZxUGToD0oS9tGl6sCbBJkcnTpqKHt8ko2INKNylPtd4ux6Jcjc+y4cE+F1zc7jHFChb8BV4OqnM5gBTVlKWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-932c428442aso4423669241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 07:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574437; x=1762179237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyGCp9ASaMEVdd7OGwSr0N7G26LNgplWkJBV0Rgw9hw=;
        b=nPlmcMDCCTDZGe6ayCcvQT8Cq3Hdvf08dje1wOk3OjC7Jqg4/59Mmmk0pZFN6DuG7c
         OXn58HT07fQ+zRJeH3fVcub+C4DLmdgsBfoKiJjOeeFXBm0kp3q0JMPA1VpHVn1kTt5n
         RcrtppYY7ypOosj2XSlh8YPunBTfBo/qCFeQdL8NSkWHlTCr8iwBRKQs4NMiIMNmP7FK
         3dnq6cdVLO+P9R+pvoDE9oOSEacCZXiKxb4w+HMa8ZiBS7UOpIbsXaQ+yj+ytALMI5hD
         JG2ULKBVlr/8yO1e/pBuZo2viOK7jQtkKtJZUcZ8CbQPrrbg3KC+8AEaCSBZQ3y0AeLk
         e4rA==
X-Forwarded-Encrypted: i=1; AJvYcCWBBX162LYONXBF0r9UJiJYqSIduBFtJ7Lzk1SxzsH/S8kg54nFJvn3cNodX7bixFrwE9rBhD2T3WWorFlNnJ/ecw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0JU0+UHuna/yvNUjhMPOw93uq/bai2EX+1f4UjkbKitiRgod
	jj+XZkJ4d8CsiBzQOqCg79py59nDwiXmFsmJ0WWZkY/2i8JP8PlenfAjtCpZ6akt
X-Gm-Gg: ASbGncvfaB4HoS9SzA1PnC5bM8no+WfpEs9uakWiL2HnU4/pu/HXbULEYEWOlvLhH0Y
	WF6vD21Tmox5DOZw+zkPmmaZpEwpYvZ+VCGlRM+YWBkQnN4VsJPmJIC6ajZ3Lko29mrzMYOKclJ
	nHPdBpOhBiUNHOPB6tbiF1n9VbCRV/fiKYFgd3kFVQb3vUsZ+ZqcRyuD088SDK9XQrZPW4ePk+C
	tz2tB2bizadG8ZpvJzg2n1+4FKlLzuvBOz2aPKt6Czbp4Ix2wgRwNJpFcKT2uK8ubcZO1B40l3e
	aGqLrn7gO6khQl7BcoUe3wjNEIAITzQa+MePKMSfVvgeRWoPdEO2j79JnwS713OGKBV7gE697yW
	hE6syb4N6MB5ZGEO4XWF9syNblZIwv/ekhO0RBH4Iv/enVPdd5mPedHTi6MVEaYxwztXluikpa8
	vgRxeBTl8qjajGLcsTgSPDjE6Z70OzSj8xLoCuyjJ473ExG/3W
X-Google-Smtp-Source: AGHT+IF0Y2sKKrye8CqwYwGMfiVvnGvTB5nzZhokUpaCRq+ETQdb76M48Ws6x6YwuXkLjCBouOs3qA==
X-Received: by 2002:a05:6102:dc6:b0:5db:3569:9059 with SMTP id ada2fe7eead31-5db7bf4a45emr134486137.17.1761574436844;
        Mon, 27 Oct 2025 07:13:56 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e4e4030sm2713096137.0.2025.10.27.07.13.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 07:13:56 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so5456828137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 07:13:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4KSUZ9u2o+cy4YcirvjDZ68y93QOke0n0h9GkptgPvkuV45L8gJXhpjPvOPIhBI+NfvTvegQvASz8Nxn+FL+1xQ==@vger.kernel.org
X-Received: by 2002:a67:e443:0:b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-5db3e22dde3mr3134960137.16.1761574434833; Mon, 27 Oct 2025
 07:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org> <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
In-Reply-To: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 15:13:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyrkDuciWUxpSM746mL67KaZvcwzFVLLMj=NmqNXdg0Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkADagh4uPO_Rn8vJHrRcLCHt41Yo3zGWeig4Q4PkqMqdfqLZfmPk9_Qcg
Message-ID: <CAMuHMdXyrkDuciWUxpSM746mL67KaZvcwzFVLLMj=NmqNXdg0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Mon, 27 Oct 2025 at 15:08, Matt Coster <Matt.Coster@imgtec.com> wrote:
> Apologies for the delayed response, I was on holiday for the rest of
> last week =E2=80=93 I'll apply this to drm-misc-next now.
>
> On 22/10/2025 04:37, Marek Vasut wrote:
> > Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> > present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Thanks!

> And just to keep the test bot happy:
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510242309.6p5FyVLQ-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202510250550.66T4zLPd-lkp@i=
ntel.com/

FTR, none of the 3 lines above should be added to the actual commit.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

