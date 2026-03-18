Return-Path: <linux-renesas-soc+bounces-29783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB5+OwS0umlWawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:17:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4093A2BCE97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C048302511D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678783DA5A9;
	Wed, 18 Mar 2026 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC4+o3mm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC93D9DDB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842636; cv=pass; b=hqoSuO5z1NflgA+GdhXhhU4LQqL7ze9wRXMr4EuqtKVVTSoOu6/0ii9bxtNIp104/f/w9qSE4v6LVh0omPZ3Sv1bKsfWre/yN1vKEknFm32LYmw0EMIOdyqV2QBg2KLgo+N5k4hcmuH8/5s+wI7TFdiqL+BORhYzEaJ6cA057ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842636; c=relaxed/simple;
	bh=8lG98xPJIcfrsLjn2HnQDuTsz4pEXOePmgQ8BC0wVhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V326cuGs2cgtx7SloIJ2y9OIWwPIo7FsopCAVT5BQdiRCl4k37m5l0P3IlbP+KpNbn0o+2rT2QNT2OyhZX9QaNUmSpZx1fOShTMHHrGOB4eK1tJplmXqleayfA9G5hHtxb4ID5O7rGdQWadJyFBwzkaD9idsr/H7LanSLaGVAF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC4+o3mm; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439bcec8613so5385770f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773842633; cv=none;
        d=google.com; s=arc-20240605;
        b=FdtiEqlj+YfTTyBfUM+idm/onrx8KGyewNogNqMMSfscYum01l9uRn3N8NKi5JpzDp
         s2/EVbFx/o3athxk+P8nOdUZJFwyEKvLsIO0d2UcAjLL0xQR6MJMh47HU57d+EcY/Kc5
         25q+6NUtTRIY4wRaIjfb+WwQQbtg0OUgxrdrpItvzCjUJk/4kMdGTHiXZNGC/l79e6DW
         rqKWRiLUvBzjBpvtysTvk5QVIjOz0DNJZVFgi48x8vv8TmfLlK5TguTiF/CZThoZmhUE
         CUu87irjJZfK2E+XfdEq7DeXR5iC8WKb1AVloUaquN6KhjSKOyEiPPErVIFiSfJj1zgM
         4ciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8lG98xPJIcfrsLjn2HnQDuTsz4pEXOePmgQ8BC0wVhU=;
        fh=ixhwDp0OXpZJ49YyUKKgRu62XBcEgRf4XCBGHV0fhIA=;
        b=aGpJBxMEFO2aZVwAPFIMxS5dLfviSei57hPHhp9O6/vJ1med5fk4qlli0hwiJ1lunA
         bfJ24ER5n1jLit8nB4eTKDsFAVnsXQVaR6QXeBz1K5LQRxmcAjWFAjfRbo61/RI1a4bt
         kXsA7/Ld9fqSU0LJ1VnkwtpFwam69HZGXPXbJUcr7Idi6UZg3z8w16APpXpmNTb1q59i
         RCFxA8jFpG0lwMxhOtHSSJRCttixR9O57ZGY0U+8dt7SPvPoILy8JgDi8DKkCTj0zCpj
         oGK390GnTnf4j+SSle1pKSMyZVtpYK0PlxHPlZ4sNVglBFm9mDDpy0YShjqbmaSeRonG
         qMfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773842633; x=1774447433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lG98xPJIcfrsLjn2HnQDuTsz4pEXOePmgQ8BC0wVhU=;
        b=CC4+o3mmp39nHQAVnTNFZq0soxOfM3NqRny07iVX63s/z6RzNOMoYwbz6FkkpOm0xu
         P9ZLoIs5N9CzBUnCsm3NJQZiYkngjTFZ33+371sYwSowyK4jM+lYEicNLSzOat97G88n
         isIsdkCaK+f/M4ghMLnwLRfV6plQqdrGGFo+8hK5AKIqOCJUbHnvTYL7ljSQfdIsnNBK
         9sfYY16yKio17rypnYP+DdRWKgYY/YtjKfRxiFiDt2xGSIR8TSe5XsHUJCnoBojJZxLs
         JxnvN2uokctG8EVCiDAAmezrRBIQjX+L0joAKCPSJT/N8jZg7lIcNhURKQer5NkGXVZk
         TIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842633; x=1774447433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8lG98xPJIcfrsLjn2HnQDuTsz4pEXOePmgQ8BC0wVhU=;
        b=EU7keatMfldJASlW+/aQhHaldJyZa8ATq/XXaxynh3+DeVIM0MjmpT8U3l60ye8VdR
         LwyfKUsETkFDq8L3mt9Bo2lKj/ngCSazMIumHKjd0dmyuykdYYen/Qz8eVXmT1H+GC8h
         zDpJruLC4uttvv3WCrYxJSU27Qh4yoVhHa+Rde3BoWFR7gbujOsLTp7h3APZOw+H7146
         6yhZYBSQPMKBTpaMIfFDyL3I+nzEM/DNB/3xlstKTSXAqJcV/vKpcuriPVTTGCi4PD54
         u3U0HpuiY9LGzUulNWtNxo7h/SQa2C3CHFrHROft2kPqaPGlWRLVGpZ9pZ1lYduIDC4G
         W66g==
X-Forwarded-Encrypted: i=1; AJvYcCVnz5H2AJTgccfm/9LHnO3Aonr9uM+EVPwiZDr8ZiOX6sw/So39XhVLmSRAlBQ0m0KznLA6FoyNMAp0/roByiXMXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsZrYZ2k4xwYmKfNalE7P4j4x2DPv8ELy+2A+H9Zn6VDTR4qI
	9zzNUZFWUIO+KWWwdwPZWLnFUX+sbXIw+aNGnZQbMrcmwETCcMPyWREOgX492+q4nvyeoKmk/HX
	acxyv1JU0s9MEIoawkAYqfbPyfTLwn/0=
X-Gm-Gg: ATEYQzxx5cc3OO6CC8xvG95mUA3zefaeF7IPoE6LWs/SxaMUfBmiDgkLlu0xDOpaGeQ
	mbJELHzCNshDG+fNir64CWCgXKahdp3+/z7AeaIJrEA/LoNP3gUJQ84LUtvMpAlyg+/Ua2rlkWk
	rcUpGGeKwWZZfI5nFU4ppmgBHZTMiR5redk07BS4G8LsXoFyPGoWe6yKaQbSV7kGjQ6M555x2l8
	mxY4abNfNxPwxJhdOuXyJlXp/Jhz9DIJMrrCgEnB43dFuZ6xTc6Ptg94o7CyDIY6xOf+ueH0LRs
	3ZYjsSgde4D9hylW8JRIAs8P7gVVkGBASnKvBEMHiWZWMZuUZ8z3W0I86AUuCYmsdbB3Rs4=
X-Received: by 2002:a05:6000:2209:b0:43b:4aba:8f44 with SMTP id
 ffacd0b85a97d-43b527c9f8amr6003824f8f.45.1773842631993; Wed, 18 Mar 2026
 07:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <abgQpsArW3VrCAns@shikoro>
In-Reply-To: <abgQpsArW3VrCAns@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 14:03:25 +0000
X-Gm-Features: AaiRm52XH_Yoj9A8pfiDuADL_vXlzcgQ_KeyAjJd28V1LoalRa-7OAaByy5sLzg
Message-ID: <CA+V-a8us8MiyRtAy9ySShY9XKepY6-Cwy3MpVgMCVK47adAV8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29783-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.899];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,renesas.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4093A2BCE97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

Thank you for the review.

On Mon, Mar 16, 2026 at 2:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
> > reusing the existing xspi_info_r9a09g047 OF data. This allows the drive=
r
> > to bind correctly on RZ/T2H while the register differences can be handl=
ed
> > in future updates as the affected configuration registers are not curre=
ntly
> > accessed by the driver.
>
> This sounds fragile to me. Can you add a comment somewhere in the driver
> or headers so people wanting to use these registers will find out that
> the SoCs are not compatible anymore?
>
I could but they would stay unused.

For example, consider the COMCFG register.
On RZ/G3E, bits 0-1 are used to control the `Channel arbitration mode`
On RZ/T2H, bits 0-1 are marked as reserved and the write value should be 0.

Currently the COMCFG register is not handled in the driver. Similarly
it's the same for other differences.

Can you please suggest how to handle this case.

RZ/G3E HW manual,
https://www.renesas.com/en/document/mah/rzg3e-group-users-manual-hardware
RZ/T2H HW manual,
https://www.renesas.com/en/document/mah/rzt2h-and-rzn2h-groups-users-manual=
-hardware

Cheers,
Prabhakar

