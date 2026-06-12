Return-Path: <linux-renesas-soc+bounces-33922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KAXiJ2ECLGogJgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:58:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB667990F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:58:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Fo6DMMWt;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEBA731CBACC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 12:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A596382F0F;
	Fri, 12 Jun 2026 12:54:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D56361662
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 12:54:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268854; cv=pass; b=ZHdMiNkWAyL2cCBDofp+QnrfTk/doPBef5rfJWDxUZJUli6oIDxqHYLJRlujRxonpaeTFRJIFJ4tevj7cxOD1GMRxQAo/weiKb0xMHO9YpjnlU5RcwJBF/u8nayXPIGJcvYmBCa1uUcY2gTw+mXfZYbpxKtj38Wg41X+I4YGcio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268854; c=relaxed/simple;
	bh=+zmRZkf7AQ7PB9Kx8oHg2bM45aSk4u6jxmk4WYr/q54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkxbaZxKotbPFaThcRqcWos+MK5C2OBpi1aapy00zsnw81mnmu4t44QEQmSjWHGfxMAI9C1CRH6tbZiPT8OMI0zG79TYXOtFT/mEryzrlhb4cJt4ylFKYGe7UGpxIFhjXzDVMM9KkbKVtORs6VHRdxHMKVS7i5qiVXLl+1/2SgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fo6DMMWt; arc=pass smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0aa420401so7234375ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 05:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781268852; cv=none;
        d=google.com; s=arc-20240605;
        b=SDSEuaiURhkdfH+WJKawwV0P9Mrxas5ZeH5i8Nzi5m0TkdbTHCdTtcGCKvY6CjT+TT
         NUM8kEPKk5q6YYDyyq5pcylV56JQAqRxzpq0RTGY4sMnuOk1hYPQHVpZ+vPTQHGlITOr
         y54WNZ5/wphldaEl2JcaKMxGLUv+y9gAxQfwRoCCWIp5HE+gP5LcRfDrkGJ+qcS/hbv6
         iVUcCW2DF6FhUpbj3tRBo4s0W7VQ5CAqVf+gJIcvCcwYZzBloo/bh5QXrgGP/wtUyPH1
         xW0i1lA+xOB9fXbawYtIcHSMKoWdRHKOzD85cgi8zL5eyaFjbfTQbwXNC1k2lYkCKKQh
         2jXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vMiH2ZEz4WyIiZ3v/uym+XH8AqV96aclIybRlnrRB0o=;
        fh=obVqxle37AgkwyqS6bDdPJz43EoNKHHYtHe0IK/ur3A=;
        b=dr+8N9CLFC3/UsFqPk1UmyrpQ3DJE61G7sVNvI75OaYcHZOuRguCye3oHz+HTsnxxT
         ruNGkyaEouByVjfHtqj5hKT+JAl1gK2ZT3KNHMp4TPI6BRN6pxV2pV/6uDxxocSrxtzC
         asopxqxKvgS080eAXpMBrbK8Z4HM+VZHtpl8CcWrSUpw8wwCxurJYIJSQSZFf+s9mqmN
         YcZVMNnxc7BOnLWpINLFg3xzzhV00u+T/0gPQ19ecx55K2UB4fiZBYbj/VuN/VlIjEtf
         bIka8wd+WOPopLIdJFvzeC6I1XHmgEVyOl2Bi6sQM53Af+QTzbpdawvbDunGX7HLufzf
         M1Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781268852; x=1781873652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMiH2ZEz4WyIiZ3v/uym+XH8AqV96aclIybRlnrRB0o=;
        b=Fo6DMMWtccis7AzK+idHPXi4Mn2R7/e9J44Wr9w3/C9djLCwS7iNO+Z+INJPkbX/gZ
         /dkuGTvLBRE2pyEll2Qr3u+LQ6me+imfOltgglHfbaE6mboBV40RYJBeGqLj+Gsld0JL
         4D9kcftw9ftVpHzxKkSoXYCUhxneL4h6UU2QwYvhSEeSDuSpDIih685eO7kdZ95lfgvO
         P6sXzuE+L15g9X0phPRvDzZqJgrpjr2AdvvenW1uMS73bW6C0XXYbwA999eX83TzsUjc
         RJIwCp2N/CdK9d5Tv0XFfgwgU8Bz4AgWQHJzReDoQ0CvJO3/5gIgLtl6fJaU5ep2yp3p
         MptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268852; x=1781873652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMiH2ZEz4WyIiZ3v/uym+XH8AqV96aclIybRlnrRB0o=;
        b=jwI7LBghBaIbmKZXE5DJ9Cvc8MuXkQGXg9n/pTxCVsCwO7viyhVRGCYXCrhv3fyAmD
         UAU+yAkwcCrqghFhLlMSHMUzHem8GUUsnYfe6sWzJiWaP4mofOjoZl7qepvLooNmIfDH
         +/dN7YV0g1WDgaoEaKPSKFXgrANcSEVoMPjviMopF8Kj2M8HUSLYhKF1B/i9nQDSP1E9
         kFVcZimo5JwsO40bZXZBipKWeP9CUTdrj+4iV/p0wOANi//leXg3wh/JmdeWSAt4ei0I
         pE/qDzd3Tzm9zihc0Q2mjZzK2ZautvhkOgXmzw8gB2D9ZBPMwboa1Xrg2eHcKfphQWkt
         eiLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/07DbF0RVBHPCW0lLbxP+Eq5kvcU0YKLr3xbO+sGTFqEhdXnIbfF5DgFkyuF6gwPVjztP2s37EKotQ/UQcmvuGPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypJxZvhT8F2x1YpH2VXAuie+WA17wGjigO2Nt6Kqzp+Ow2BOVQ
	UThMnJVs9vk+g92ObJh1ZDcf6carBrs35eyYHy7FP8xws++oxmJpY+HmTwfGow8yIT66BCRJx6O
	zJ4zULqWq4/Y/RlUxJUuIOa/Kh/aqyMk=
X-Gm-Gg: Acq92OEV+xdTOi4f3Hav/MhnUxDWHtBiQd7Z8db70QqyLwXLTIqLUK/midOxkpvb68Y
	cA1fN1+GcQLQ1kGm/YHwrT/PA7gsX0nst2UTiIDgwiBp4sry0iVXWajGaLdM+NB6ZIAHIvEOw0N
	k1ItZ8bp5j6l15dzNCzFVv8nWf91cPWkVgzUipAK4EIalrW+WIgkWf22m+i605CUlqhBjxGeEeM
	P05f4b7zXwRUL/ZX5MI3A/cXUwEsI9KkSoZJ7Sf8SnAZXBW+rDLReg8oQtY/9tRzV3EnA66Z1KN
	dGmaZfZ5yEREcN/QsAmMny+xyZRQceJ9R1NAKQ==
X-Received: by 2002:a17:902:ea07:b0:2b7:aa20:3c61 with SMTP id
 d9443c01a7336-2c4134ec603mr33662135ad.33.1781268852381; Fri, 12 Jun 2026
 05:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com> <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
In-Reply-To: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 19:54:01 +0700
X-Gm-Features: AVVi8CdLk4S96wYsYDBqrdC7z70oBdDD1ZwZrYm2niDWr8Nvh0Eb0jy8Rs6iHGo
Message-ID: <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33922-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EEB667990F

Hi Geert,


>
> According to my schematics (RevA), R120 is not populated, but R250 is.
> So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
> and the MCLK-pin of the WM8978 codec.
> Which revision of the schematics and board do you have?
>

Oh, sorry, I misread it. You're right, mine is also Rev A, and R120 is
not populated, but R250 is.

>
> I haven't located R120 and R250 yet, so I don't know which
> configuration my board has.
>

Please flip the board over; these resistors are located on the bottom
side of the board rather than the top.
Other components like R123, R124, R139, and R227 are on the top side,
but they are only visible after removing the display.

>
> That information is found in the R-Mobile A1 docs (PORT11):
>
> Table 1.3 Pin Assignment (505-Pin BGA Package)
>     Ball No. / Pin Name / Multiplexed Pin Functions / GPIO
>     G3 / FSIACK / FSIACK/FSIBCK / PORT11
>
> Table 54.1 List of Multiplexed Pins
>     Pin Name / Function 0 / Function 1 / Function 2
>     FSIACK / PORT11 / FSIACK / FSIBCK
>

It would be helpful if there were a more detailed Armadillo schematic available.
The R-Mobile A1 documentation (PORT11) is generic and shared across
multiple boards,
so it does not necessarily reflect the exact wiring used on Armadillo.

I did look at the board support code and pin configuration some time
ago, and I also tested audio output over HDMI successfully.
As far as I remember, these pins can be configured as either inputs or
outputs. For example:

fsia_pins: sounda {
    groups = "fsia_sclk_in", "fsia_mclk_out",
         "fsia_data_in_1", "fsia_data_out_0";
    function = "fsia";
};

I'll take another look at it when I have some time next week.
At the moment I'm busy working on a few ASoC cleanup patches,
so I haven't had a chance to investigate this further.

Best regards,
Phuc

