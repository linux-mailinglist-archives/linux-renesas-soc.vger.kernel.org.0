Return-Path: <linux-renesas-soc+bounces-19561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 393CEB0751A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 13:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25341AA5400
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 11:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5309C2F5313;
	Wed, 16 Jul 2025 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CQq9LCj+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF562F4309
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jul 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752666820; cv=none; b=QZrlVP2EhI6cGf0YJSgNJYGRHztPU3IIKqRWROPhA7qIF0mmaanbMjONjH1Bl2s0JRZHvV1UgbWZSYQRWG2YSm9VoGOQVl5pqf5oft2mWnjdMI7WRC7fcZz8rRQajggITNXHzACZKZ3zabFbjrfsJQANfO07Gi0HH2RHcTH1OJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752666820; c=relaxed/simple;
	bh=hAy5rHEmab1rtV6YLUXreFd0IRQGbfqTQ4nL5HHHhAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddFmUwkPYXBSA8j6RrCY/xWNunNwamC2ND8CsyNcrp9ZHUwQMv+HA6Y+wYwIt+aCNUgimvdnT8lo/F+rgYZz1bVpL5br/p/EBqd5wlVGRhI0yWdREV8DWEX9feXiujhihX+txG9BHGI6nTHEfoGsJcscsyzP2mJ1/WqhxAqTFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CQq9LCj+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Nd+u
	5rHVgfOlRaJ/WUxx0emekX1DNctLq0yZ2TyMLdE=; b=CQq9LCj+mPJsV13BV8St
	NNFRPb7EujCGrZrNr60wo9cHgMUsJrAbldKPi4E9khCqS9gED+k/Ch+5TSUo2hDw
	ugYW69QEH5VCE37C8MiXWkvXU7dFAv6Tj/CIFG+8AvyYZASwd9TaIP8t3DDIcwGO
	d5j6C4pOxYUZYted2UqU+s1lD0R4IR/IwSA2V+SA2ma9axYvn5rFkPYfRD2hARtc
	AIhnWVbAziWzBfkMyK5b88tmnBtetSml2mCQGBWR5Psh0O7ZM3qST01WbK45nEWB
	AD/6q0wWuXSO6h5ZJnvvsQh57Hnk6F3JXrKsfFnm+6KhYdgYIje61q1flZdcW9q0
	zA==
Received: (qmail 3297432 invoked from network); 16 Jul 2025 13:53:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2025 13:53:27 +0200
X-UD-Smtp-Session: l3s3148p1@CRVtigo6Kqkujnta
Date: Wed, 16 Jul 2025 13:53:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: add driver for Renesas I3C controller
Message-ID: <aHeStuQ4ymIlyNE4@shikoro>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-3-wsa+renesas@sang-engineering.com>
 <aHZuAIP5IBoulm+9@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHZuAIP5IBoulm+9@lizhi-Precision-Tower-5810>

Hi Frank,

thank you for the review!

> Suggest commit message:
> 
> i3c: master: Add basic driver for Renesas RZ/G3S and G3E SoCs
> 
> Add a basic I3C master driver for the I3C controller found in Renesas
> RZ/G3S and G3E SoCs. Support I3C pure busses (tested with two targets) and
> mixed busses (two I3C devices plus various I2C targets). DAA and
> communication with temperature sensors worked reliably at various speeds
> 
> Missing features such as IBI, HotJoin, and target mode will be added
> incrementally.

Ok, I wil use this message. Thanks for providing it.

> > +F:	drivers/i3c/master/renesas-i3c.c
> 
> Add i3c mail list?

It is inherited from the I3C subsystem entry.

> > +#define STDBR			0x74
> > +#define  STDBR_SBRLO(cond, x)	FIELD_PREP(GENMASK(7, 0), (x) >> (cond))
> > +#define  STDBR_SBRHO(cond, x)	FIELD_PREP(GENMASK(15, 8), (x) >> (cond))
> 
> I think pass down od_low_ticks instead of cond will be easy to understand.
> 
> STDBR_SBRLO(l, x) FIELD_PREP(GENMASK(7, 0), (x) >> ((l) > 0xFF > 1: 0)

Well, I think the fact that you got it wrong is indicating that it is
not so easy to understand :) It should be:

STDBR_SBRLO(l, x) FIELD_PREP(GENMASK(7, 0), (x) >> ((l) > 0xFF ? 1: 0)

I also think it won't gain us much. We still need the 'double_SBR'
variable to set a specific bit at the same time we use the macro.
Unless you want a dedicated macro for STDBR_DSBRPO as well.

> But still strange,  l > 0xFF, you just shift right just 1 bits.

Yes.

> what's happen if l is 0x3ff.

The driver bails out:

+	if ((od_low_ticks / 2) > 0xFF || pp_low_ticks > 0x3F) {
+		dev_err(&m->dev, "invalid speed (i2c-scl = %lu Hz, i3c-scl = %lu Hz). Too slow.\n",
+			(unsigned long)bus->scl_rate.i2c, (unsigned long)bus->scl_rate.i3c);
+		ret = -EINVAL;
+		return ret;
+	}

Oh, the last two lines can be merged into one...

> 
> > +#define  STDBR_SBRLP(x)		FIELD_PREP(GENMASK(21, 16), x)
> > +#define  STDBR_SBRHP(x)		FIELD_PREP(GENMASK(29, 24), x)
> > +#define  STDBR_DSBRPO		BIT(31)
> > +
> > +#define EXTBR			0x78
> > +#define  EXTBR_EBRLO(x)		FIELD_PREP(GENMASK(7, 0), x)
> > +#define  EXTBR_EBRHO(x)		FIELD_PREP(GENMASK(15, 8), x)
> > +#define  EXTBR_EBRLP(x)		FIELD_PREP(GENMASK(21, 16), x)
> > +#define  EXTBR_EBRHP(x)		FIELD_PREP(GENMASK(29, 24), x)
> 
> did this pass check_patch.sh? I remember need (x)

Yes, it passed.

> maybe run check_patch.sh --strict

I used --strict. Does it complain on your side?

> > +static void i3c_reg_update_bit(void __iomem *base, u32 reg,
> > +			       u32 mask, u32 val)
> > +{
> > +	i3c_reg_update(base + reg, mask, val);
> > +}
> 
> It is similor to regmap. If you use mmios' regmap, needn't above help
> functions.

Is this a suggestion or a requirement? I'd like to keep it this way.

...

> > +static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
> > +					struct i2c_msg *i2c_xfers,
> > +					int i2c_nxfers)
> > +{
> > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> > +	struct renesas_i3c_xfer *xfer;
> > +	struct renesas_i3c_cmd *cmd;
> > +	u8 start_bit = CNDCTL_STCND;
> > +	int ret, i;
> > +
> > +	if (!i2c_nxfers)
> > +		return 0;
> > +
> > +	renesas_i3c_bus_enable(m, false);
> > +
> > +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	init_completion(&xfer->comp);
> > +	xfer->is_i2c_xfer = true;
> > +	cmd = xfer->cmds;
> > +
> > +	if (!(i3c_reg_read(i3c->regs, BCST) & BCST_BFREF)) {
> > +		cmd->err = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	i3c_reg_write(i3c->regs, BST, 0);
> > +
> > +	renesas_i3c_enqueue_xfer(i3c, xfer);
> 
> You can use refer mutex GUARD define to pair renesas_i3c_enqueue_xfer()
> and renesas_i3c_dequeue_xfer().

Well, looking again, I won't need this. There is no 'goto out' after
enqueueing. So, the label is wrongly placed. Might be an argument to
remove it...

> 
> > +
> > +	for (i = 0; i < i2c_nxfers; i++) {
> > +		cmd->i2c_bytes_left = I2C_INIT_MSG;
> > +		cmd->i2c_buf = i2c_xfers[i].buf;
> > +		cmd->msg = &i2c_xfers[i];
> > +		cmd->i2c_is_last = (i == i2c_nxfers - 1);
> > +
> > +		i3c_reg_set_bit(i3c->regs, BIE, BIE_NACKDIE);
> > +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> > +		i3c_reg_set_bit(i3c->regs, BIE, BIE_STCNDDIE);
> > +
> > +		/* Issue Start condition */
> > +		i3c_reg_set_bit(i3c->regs, CNDCTL, start_bit);
> > +
> > +		i3c_reg_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
> > +
> > +		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
> > +
> > +		if (cmd->err)
> > +			break;
> > +
> > +		start_bit = CNDCTL_SRCND;
> > +	}
> > +out:
> > +	renesas_i3c_dequeue_xfer(i3c, xfer);
> > +	ret = cmd->err;
> > +	kfree(xfer);
> 
> struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);

... by doing this.

> > +		/* Clear the Transmit Buffer Empty status flag. */
> > +		i3c_reg_clear_bit(i3c->regs, BST, BST_TENDF);
> 
> Are you sure you can clear FIFO empty status? Generally it is read only.

Yes. The datasheet says so. If you want to double check, page 1715 of
the document which link I provided last time.

Thanks for the input, I will work on this now...

   Wolfram


