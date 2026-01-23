Return-Path: <linux-renesas-soc+bounces-27320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLn1HX5ac2nruwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:24:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B185774F7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B751D300B066
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE770322B89;
	Fri, 23 Jan 2026 11:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXTOifzY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F52D3EF2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167477; cv=pass; b=sTSwjfVyX+sAcFfumC9u8fl8sfBNsTLIH1JHKiep11lXtwxrhvlrVSXou5pc9dIJaF8rQ7aXACnx+mgvpzwe4ScBvmVg6HN5lA3QM++d7h7h2YAACXH5JAg1yCW6QPD6/Pp1uNDWpNzYNJdyVF5Mwd9whJc+ihoalc+xidENuhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167477; c=relaxed/simple;
	bh=SvCcMzMmPe9wEcguofXsqbsLD2QsWjpUfqlt9B/U8bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ap4IvQporasckg/fMP8gQ+qoKRWl9RHlNIz5DGjs1KSrhROh6JNymYTW+75ntroei4+PH5jpOums8/8+kiZu5DMTnyp1BvEAtgAzDVec6LO8XSef74NcZ8jxSDvBZwlgCyLptko3Ckta3QIXV5nDOe53npnWiQDD0AEV/WXdhTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXTOifzY; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359249bbacso2026831f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 03:24:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769167475; cv=none;
        d=google.com; s=arc-20240605;
        b=Qc+YAiKy11rd32N7McMEhXZnHVTDD9X3NVp2edWWtjjM1h8QsM8qgKenuqnUbngoj/
         oE/xzimLHmOke2ea4DqMyp4P6SdQ94gKLyK0b8VQKTld5mTCfmCqGHPYvGw7PXFbHcuJ
         D0iPdr6H1Fh0c0FiOYXjneQMkLz8IfMlEdJ7mcZd3NOwiP8Yv9wKWYrzgL5UZ7UTCnPq
         zFsS0j7DV7pf1g3zfCzrlz1o715ucI+9I/1FuW0Dr77hLaCVYzjzHfB3KvMpk1RIqFiU
         IZbElfoLUqaAUf8tKlyp86ubHWFpfpxirV9uFn7vUVqXP1fJ1690AUauqzacN4EkgOX/
         EMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f6yFXMf50QjzEQUHEtCAKGNWrVkrqykIkAUPqBjjBRQ=;
        fh=rRIVLofr7Bfb033Wq0Wubik4BTixS6Mci8dNl3bltD0=;
        b=eooXlC52eTpO3IsnPbRKh13oPNScsbsXiS/dOnvBCv5qAdY/XNjrlRTpiv2YIKnu3f
         CpgY4cVwwVbCb1J8BXTVN7E9WqVHwGcOGzu8zb2LFsdr6uuqDGWDDoCX3jkfyiy7MMq4
         tD+x0pTr+UpK2SCaVWHInmAQN3ZjR69sZDllUefQXWikl+GUlscUqJ6D7A93s+crEvVr
         VkL7bcYJ0c3fODrK87DVRUTDj6LqdHyZPLdg4gZqkJB3QO4Kq5of1kaOZmeeegtkrxyP
         K3dGyDuplL1Wu996JbMQfK5a2TO1/VXMyy/RnUfLSHIwQq9QzNgELygOv9uBncFdwEtv
         s5Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769167475; x=1769772275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6yFXMf50QjzEQUHEtCAKGNWrVkrqykIkAUPqBjjBRQ=;
        b=ZXTOifzYS5QWgc3H3cLKZyWL8hi4segKB5FNk7HmX73yMqwVv63d31hdKPy0dpXi3g
         HvsYCUw+YTzDue8FHRL6kbIKT1fne9oXVH0cFNyiGWNEZ+52Nrc4qVspnsYp5xHSwAns
         zey20pwijfnlrVpPk6BblnfNx2fcMDmVMYVBvKM+XAUEoTcj/Cju22uSeBEQl8ylxq8E
         J0TRS8fudheen4RD8JZHEGKoZOjwWjuw8DrzYRMCmYZaHPSkuLGsvF4NbBpX2JUvtf/F
         zHRZ18YOCoMP8c8aIAIrH6DUQ6XOZ5QnWkdNx36aUrlk7Ug53jgEgIHYBjO6MGT7BUts
         t/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769167475; x=1769772275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6yFXMf50QjzEQUHEtCAKGNWrVkrqykIkAUPqBjjBRQ=;
        b=L0T7sjwnwlX71L+m1mxHpKPlgS/M1QXJqijEGTPaj3uBm3SLCOKoVCF1igk4icX5OV
         u9lHdc+Gybl/kNbADTnwG5YvjGWeHOf8ZoWj3i+e8oAAUXseZ/kNYyxvgugBgqCsoTTL
         V1Il4ymCo4b+v3lCzb2Y9KJrqMnYG5D6maFx2HXvXvds80JQRujmfHx6P/Z8weDizdlT
         KNMu4JRZ/8ggafZxNY09z1h/ZUZ0xLeaFcSSS12EKe/WxpvowVoSszWSC78vEktpdIVs
         yC2LtZlzFfKaWG9Q/j+r7caPUVWqRMAYjB2HRnMuC65geUU6xpPzLetQaVR77yGvaxVc
         4Vow==
X-Forwarded-Encrypted: i=1; AJvYcCV/QlrJXbO5jYvbomzzCI2muOncH/8c5imph304ZMyvyrgL+PpvQa6WN0J2d3hxpDSZBoewhUUvOuAxJ/4gz7tEDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17qxbH1iGeIUo7OxE39Yis6ANqpIK2M9S2/LVvU5mTj1slPdT
	UY6aQcKys6iBoelrm8fntj0K3b7fQ9vZ8bFlWAjNdLzkAbq+Za/QUrcdIl/1opF82S1TmT7N2gr
	zrrui8u/nLrLWB5HqM0Ydp0hLWWC1InM=
X-Gm-Gg: AZuq6aK1i9F4192g0NVENp6vVtySrUSBVTLgMmXdN9PZ3HaMniPEKBusAEgmBXv60Ml
	YPJjUJrDHjpY1ScK14CaQjGG7m2MGZRckfW6vFYLLiFA6ZufWQWRrZMtF8dtqwBdjCO//EzjvNH
	O4qO09FzYWsbp+B6BCzJJqU8Ioy5YAN+yfAX24FoXASPjKcOrqD8a+ZZNAZnQJ9UKfv7zNzMOt9
	o39KUKu7f7YigCHPsjf0fUqoHczG8S7t0/qSIs+gks+4LCwABwmUdwa65Zxpn9o+kUs0TYgPyNQ
	WGM4O1IpnaSI9i877+6bgTT3CnIaiGXfZQssTlAguiMWqA0MgZFxIpx6Al2SuZpqk5GYxvN6aD2
	8gS+riu2RqlrCKg==
X-Received: by 2002:a5d:588b:0:b0:42f:b555:5275 with SMTP id
 ffacd0b85a97d-435b1ad2c3bmr4271171f8f.10.1769167474269; Fri, 23 Jan 2026
 03:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVmh7tG0D8az6E9tWE8iHhxvrw56o-u5DR53Rpcoh45qg@mail.gmail.com>
In-Reply-To: <CAMuHMdVmh7tG0D8az6E9tWE8iHhxvrw56o-u5DR53Rpcoh45qg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Jan 2026 11:24:08 +0000
X-Gm-Features: AZwV_QiKOz5WIufcXdnua6_i2WKJ1ISInXJIHbwsJGOzji45TdIcSQcxTkXOYDM
Message-ID: <CA+V-a8uUkBdFdY2k66onXStB3wjy_wocoqVviGKEzEOyvojR5Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27320-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: B185774F7E
X-Rspamd-Action: no action

Hi Geert,

Thank you for the review.

On Fri, Jan 23, 2026 at 10:45=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 21 Jan 2026 at 16:01, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWIN=
T)
> > that allows software to explicitly assert interrupts toward individual
> > CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
> > interrupt.
> >
> > Introduce a debug mechanism to trigger software interrupts on individua=
l
> > Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
> > CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
> > explicitly enabled.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/irqchip/irq-renesas-rzv2h.c
> > +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> > @@ -11,16 +11,23 @@
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/cpu.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/err.h>
> > +#include <linux/fs.h>
> >  #include <linux/io.h>
> >  #include <linux/irqchip.h>
> >  #include <linux/irqchip/irq-renesas-rzv2h.h>
> >  #include <linux/irqdomain.h>
> > +#include <linux/kconfig.h>
> > +#include <linux/kstrtox.h>
> > +#include <linux/moduleparam.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/syscore_ops.h>
> > +#include <linux/uaccess.h>
> >
>
> [...]
>
> > +static int rzv2h_icu_setup_debug_irqs(struct platform_device *pdev)
> > +{
> > +       static const u8 swint_idx[ICU_SWINT_NUM] =3D { 0, 1, 2, 3 };
> > +       static const char * const rzv2h_swint_names[] =3D {
> > +               "int-ca55-0", "int-ca55-1",
> > +               "int-ca55-2", "int-ca55-3",
> > +       };
> > +       struct device *dev =3D &pdev->dev;
> > +       struct dentry *dentry;
> > +       struct dentry *dir;
> > +       unsigned int i;
> > +       int icu_irq;
> > +       int ret;
> > +
> > +       if (!IS_ENABLED(CONFIG_DEBUG_FS) || !enable_icu_debug)
> > +               return 0;
> > +
> > +       dev_info(dev, "RZ/V2H ICU debug interrupts enabled\n");
> > +
> > +       for (i =3D 0; i < ICU_SWINT_NUM; i++) {
> > +               icu_irq =3D platform_get_irq_byname(pdev, rzv2h_swint_n=
ames[i]);
> > +               if (icu_irq < 0)
> > +                       return dev_err_probe(dev, icu_irq,
> > +                                            "Failed to get %s IRQ\n", =
rzv2h_swint_names[i]);
> > +               ret =3D devm_request_irq(dev, icu_irq, rzv2h_icu_swint_=
irq, 0, dev_name(dev),
> > +                                      (void *)&swint_idx[i]);
>
> drivers/irqchip/irq-renesas-rzv2h.c:730:23: error: implicit
> declaration of function =E2=80=98devm_request_irq=E2=80=99; did you mean
> =E2=80=98can_request_irq=E2=80=99? [-Werror=3Dimplicit-function-declarati=
on]
>
> How does this build for you, without including <linux/interrupt.h>?
>
While posting the patches, I had rebased them on next-20260119 (and
used defconfig), but I didn't see any build issues. Below is the
snippet from irq-renesas-rzv2h.i:

struct ns_common;
int open_related_ns(struct ns_common *ns, struct ns_common
*(*get_ns)(struct ns_common *ns));

static inline __attribute__((__gnu_inline__))
__attribute__((__unused__))
__attribute__((__no_instrument_function__)) struct pid_namespace
*proc_pid_ns(struct super_block *sb)
{
return proc_sb_info(sb)->pid_ns;
}

bool proc_ns_file(const struct file *file);
# 20 "./include/linux/efi.h" 2
# 1 "./include/linux/rtc.h" 1
# 17 "./include/linux/rtc.h"
# 1 "./include/linux/interrupt.h" 1
# 9 "./include/linux/interrupt.h"
# 1 "./include/linux/irqreturn.h" 1
# 11 "./include/linux/irqreturn.h"

enum irqreturn {
IRQ_NONE =3D (0 << 0),
IRQ_HANDLED =3D (1 << 0),
IRQ_WAKE_THREAD =3D (1 << 1),
};

typedef enum irqreturn irqreturn_t;
# 10 "./include/linux/interrupt.h" 2
# 1 "./include/linux/hardirq.h" 1


Tracing through the above interrupt.h was included in below :
---------------------------------------------------------------------------=
----
drivers/irqchip/irq-renesas-rzv2h.c - (line 19)
#include <linux/irqchip.h>
#include <linux/acpi.h>
#include <acpi/acpi_io.h>
#include <asm/acpi.h>
#include <linux/efi.h>
#include <linux/rtc.h>
#include <linux/interrupt.h>


Now that you mentioned there was a build issue, I tried with
renesas_defconfig and I do get the build issue which you pointed out.
I'll respin a v2 with #include <linux/interrupt.h> included
explicitly.

Cheers,
Prabhakar

