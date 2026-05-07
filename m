Return-Path: <linux-renesas-soc+bounces-32268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPKlHjj//GmxVwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 23:08:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED24EF1DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 23:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 249C730329B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 21:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639D833F582;
	Thu,  7 May 2026 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKmKnVBo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A93346BE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188073; cv=pass; b=UiYmFC5u59lRbPdvlE4KmqhjdgA5o+9fJRql00oIgY4e2lC4ztv++dBornjqK6pKEr+aS3VJXtA7EEYUC22vzmyzl5Di65ljAK2iO2SnafOUeE7qBD1py/AcPsaAZMDeZ/AYsyShz64In2kQC6F1ACRuq+TWJQxUPf1BkeysrLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188073; c=relaxed/simple;
	bh=aBJIgwvRZ5bDYFwZSVhUKwV7mk8QWSacw/0SLleDz6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/dbUxmnKOPUBlbsyDGmiCp7EJE44lTW6WrK13wMr5XCE2wTUEFd16HXBlcnkDDEdbeRwYohojpdgybi9c++Q3JxIbuGAth9vPKT8gO66SkTEPXT/rHPetucNE7QmfksoubR/YSazXi00DcGSrTSg3Fnax8dpCr+1WASMB8St/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKmKnVBo; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44e1860558fso950611f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 14:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778188070; cv=none;
        d=google.com; s=arc-20240605;
        b=Uwfz1HzfQUB94XlW2CXoHx1txyI83JlG2eITLkzTfbC9Ffj6Jw/2zpFkbhXX02DO/v
         sGaxsYyalIOAgY4m3Yxm/58n3keT8C1xRUrvT0B2baK/figvlw+PqDnwKrZFukSzft+c
         6Fg9f4mqyv5L0JDxmsjiUIIOkTuxNSUGohjUNvdoI35hLatiRPsy+/CCqgzWOGz899M7
         Z4nzv52lZH5A92EmefvzGzcrkvOkFdJLTBcgr1AfcDH3xUbIqzKq4n0zfNeLPx5KOo7s
         Auewb9GQGfvDeDv5i7nTkuKYu0kpd6TOJgr8UgZQXhccPt6G2ms7kUGt6Njb+285BPxa
         ehFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JnyUIT0CqT/tcTXev5pQriZQPfBtV2tf3vER8rM77W4=;
        fh=SPBZzfc0x0ynSdWD3yJHaTZPcE+17AhjBGLKEeXkj9U=;
        b=MnQZ8uiOOCNJyaX2hQRlhEK8NqoI1i0uOMHAgV0N8seQN67SiZqop/QFXgtB1wxoKm
         2V8dlimhQYfh90U2aQC8gpX99hap5BFFQ90eQLIFBkoeP/NafopxD7zc/9yzWr3Mj0BO
         hTEY5t4gNXZZu5zt5u28I8JG2AAvgG+9PYeEkzV5wb99ASsEt/FS+2FR4uUObjQ/T88c
         B264v02n1+nsC6XzmpvUWRvI7qPTrCgghU5hpb4UNYMf+A8aQaa/LZcWtRWmLyPt27s3
         Scns/D7gm24aEZts20XsINBLbIjjcEcCbOdgwnPpZS8U5CZaUvXvEzjZv5dDa30aOHf7
         O+5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778188070; x=1778792870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnyUIT0CqT/tcTXev5pQriZQPfBtV2tf3vER8rM77W4=;
        b=QKmKnVBocf/rknc+LntoolTNg4DIdwwhpFoIWiGf7Y0h8vK9TT7X1HNyP69gvy44eC
         prVejvzjbbHsYHkxKf0SY/XTdtFnWgzbqDBeAA/a29ghrkA2Ndf0NRNUdsnJqs9jYedi
         VrdONwdhpQwTMgM5tkkpe/6aUWaX29zCv80W7Tc5VmDnrII+8ikTajlhK3IIBGerjgUM
         y7hRFJb62XyCW4OYnNguYAOfnqUITFzBnbnogm1wkkTUJfQkgZJ+0O13q4YGxScHwLku
         ATxwkVd5L9FqW2ecHC/pyksBpyNateDkkcDdvBLDuStdwQPpvuaxhmwk7QKnQkT3jkSc
         gjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778188070; x=1778792870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnyUIT0CqT/tcTXev5pQriZQPfBtV2tf3vER8rM77W4=;
        b=J956uaXt6W3qXOc1eef15VoX4EBch0gpdqy/NDztdmSKyufvl/Dj7IqjUKjz6aNX5p
         RSmCC95XwSxofQXSZ5RT4dzSFFfYZBkqdLji0J6gKbdswNKlS1K2RGJVwNx/vvDYGCP+
         BdZqCRaDv7fH7b4crvWMOaWAMvD9SnnAvOLmw8EnTlrKyjttFq2rYNfFQybMqZOId1wG
         WRwSFUx9tWGW3losmkZ8ysipqdeEtiufzjbeeYVDEorpy0fbqOsbASPGMLbok0Nx0HN2
         gydcTTaWj4BhqTmx0zmiAZe/GC2NKjP7pu0FePIJXE3HefZ//JCNRVpHPns4ym2yOsb2
         3AWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M+tXqU4XMo1yJ1gLEMp4QGB9ZMHmc1TuaaCEFNov2xivCiPopl/h0+6a/XBnujWOl0fzkQI0n12pMsip0oz3lRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJi5NdXxtVNeglogTfCehToXHtSc++W2dwZEeXDfwRTljRmFXb
	rgcDaTsTitJ6zR2PzPOqT4rGaYDAdCEM8VEr60US/hnU38bzREBDcqfbxJfxV4L21/hh64sCZ+B
	VRvHZ2X9CB6eNfFt7t1eVisIt60T/pf8=
X-Gm-Gg: Acq92OGwxaLzKJ3yA+640ug9CDVdgU0n954D18grbq0Qf7YhDdbKfODxHXRn4APEs2n
	yyu8baflYMpmJ55WOkG6HubK58smJmkdUd8bM45MnhW+jSdbRv4yMmKx0zw/PQTTSg8RxXtfNU9
	lBOYwUGU76ZRDE7yzMJYwo0j21L5fJUkYsiCVo8Uc9EF1bRsGGVILL50o0l6M4xXtA7rmsbYAzg
	aEgbe37e0upmnJROP+sKodHA68gWcv0MH/rXhCOJMxf8IV+guCMn+5FBGLyYdZ5BcoKVGsb9B/i
	ZCcE9Iy7rIddpKd7dyCMsXjjgcMNgn0jfysYG6LZdOA343PyNQSRVM14TTXaWyE9JRVuHQ==
X-Received: by 2002:a05:6000:178c:b0:43e:a73e:cc8a with SMTP id
 ffacd0b85a97d-454636d22d1mr10067f8f.36.1778188069907; Thu, 07 May 2026
 14:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507154710.3903732-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <2026050732-discolor-suing-ef2d@gregkh>
In-Reply-To: <2026050732-discolor-suing-ef2d@gregkh>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 22:07:23 +0100
X-Gm-Features: AVHnY4I5MzZslxIhDkfkF3rp0iHb2Pj2F4JIETsUtLDHLvbsHpywCDyA4uSRmTk
Message-ID: <CA+V-a8uqVGNU-_4yYs4nJc=J4TRDpppnh+tZeVhu5gOQYNvPqg@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: host: Default CONFIG_USB_XHCI_RCAR to module
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D6ED24EF1DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32268-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Hi Greg,

On Thu, May 7, 2026 at 5:20=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 07, 2026 at 04:47:10PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On R-Car Gen3 and RZ/G2HMNE SoCs, when CONFIG_USB_XHCI_RCAR is built-in
> > and the system boots with an NFS root filesystem, the xHCI controller
> > probes before firmware becomes available. As a result, the firmware
> > request fails:
> >
> >   xhci-renesas-hcd ee000000.usb: Direct firmware load for
> >   r8a779x_usb3_v3.dlmem failed with error -2
> >
> > Default CONFIG_USB_XHCI_RCAR to module on ARCH_RENESAS so that probing
> > is deferred until after the root filesystem is mounted, ensuring that
> > the firmware is accessible.
> >
> > Configurations explicitly selecting CONFIG_USB_XHCI_RCAR=3Dy are
> > unaffected.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/usb/host/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index 0a277a07cf70..b70e019cc3ac 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -90,7 +90,7 @@ config USB_XHCI_RCAR
> >       tristate "xHCI support for Renesas R-Car SoCs"
> >       depends on USB_XHCI_PLATFORM
> >       depends on ARCH_RENESAS || COMPILE_TEST
> > -     default ARCH_RENESAS
> > +     default m if ARCH_RENESAS
>
> The module type here depends on your root filesystem.  If you are using
> nfs for your root, then you always know you need to properly build stuff
> into the kernel for modules that need firmware, this shouldn't be a
> default thing as NFS surely isn't a default system type anymore.
>
I agree. The module handling depends on the root filesystem setup.
I=E2=80=99ll drop this patch.

Cheers,
Prabhakar

