Return-Path: <linux-renesas-soc+bounces-29566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMHEFZ4fuWmergEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:32:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E72A6CD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36166303D8A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A54363C78;
	Tue, 17 Mar 2026 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IW4rO2Pk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54536166D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739822; cv=none; b=kOh9jzR6vDdc40DptNYm2D1A2eRkfZpxq5hZ7R+iKe6dR3RInYVzgnbqTif/ZhODP/BB2IVuh6qQeoRTlV+Dl0NbILnNjGO0WYvq/rk91NqXEH6UagqeUPgBHzmE/WDMn/NdfNvS1MjoMIFyGhsTLLgveiNbIXxT9/QDng0AFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739822; c=relaxed/simple;
	bh=n9yV0EKW0ePeyskDVcCg/LnzxUaGeegIs/HWjeZnKec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF4wG6rTHZQCPgdmXgF4Mbw4jRRSC+J9QJOnEKKs8D2DSQlA4ctkXDoejCPdee3ERzmqTXQONrkhFFvjSJh/4aFCGoEXWV8G/Z+P5I0de3egfB9RdvGE2ThptNKQwJhZQCCdLE3fmS5rl8PjffJy7FmydyKZpqdPtg8dV/XFB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IW4rO2Pk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1307438ddso5457874e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773739818; x=1774344618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1Y0fq+nOdX5B9Zlv9rWb/FlWGr7tCSJEoVxQK36Zz4=;
        b=IW4rO2PkNtgphTIcWlL8DIP6D3aL7IKTyxWbQas2ydbJrfk0aiB9VU9w++L0i5DDex
         pZkOdYH9HpAHjOWiy6me+EDVYIJynnXCOyx9DvcWvJtOArvI2w1oOopeGlqCKbX5M1WV
         9Ehn/DfClD19/xyAgS4xTUPxULD4czvm3eGsDorAejH4P0McO9tElTn7ezp2MFkhcMal
         AruVwCkrGQTuSbyKgP5Z3qmlONEDVqCaHUYN6VVPNJmhmN0gAObTB9HhxeqdZfkZhpIF
         dnj3Y8oOXYsx5+vzjczOQYDWImffQqL4155OkwsR7mDDOpJIoS40b4gEUPQHZp+atrUm
         +6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739818; x=1774344618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1Y0fq+nOdX5B9Zlv9rWb/FlWGr7tCSJEoVxQK36Zz4=;
        b=Txos9DljaUVJWaTeAuVbW0FxOaWBY2mlGAUMM6P0ViDQN8Emqeeh5TZpO2iCullEcG
         h+Vz3U7VSrasLTMh26RtACUxqkpauFN3WxRz7FLrBoIo42igF0G9YJVx9w5vfybryyFb
         Pt+bbJT/MfY4VFte6rrmNfeToR+k8OeH8gHxeDfaj6C15pm1OR8qjeadyPfVHzyAVU9A
         WzlIluutH03eSChmh4lYuQa50ZugBLwDZQGe0Jec4bWHVoXXM55bzWMTGbdHB9rCV0U+
         EY9rpTRb16gz49Owq6O55dJg9N5LrXzFfpAbTS5ostmh1Tx00J/NKpFkbD/MsIr5qfJM
         JTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Nl3JgAPNtt5scI5hLkiZXOGLD8KAs/YIseT2+KICSsRlgaEE9sS2LlxjK0IVUI3CuNQ8UPApybnczPrT+FCMKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDpgbzc81DSWZZMXUTfywn9SyBQokHeCRT9L3g4NaWeuHwWG60
	dK+Q9xbHXh1k6tWbRttWgrgiT6LXr9wdZgx6KtU2U4q2FNy83SPqj1gKpcb4rirzj1g=
X-Gm-Gg: ATEYQzzGYWJjPrqEu1k8kyPtz4Q4jRLf+OX5V1XcMHBw8ms3+y4k4GJcLgVYNDTogsG
	4hGwH9o7/huzQUuNtWBHKFcChF+AEiJduEf3ndBOBNqt0teezDjsJjX5z/SEhpzk/DKho131V5p
	Hz3+dLyxsXJLn8BahxpBboKBhWGEgAmP3BzQqcDRjd6P9pbpYhsabPEZcc29bPnvyig1J2GcItW
	y+T+VMSWVJ+FlrH0v61LIusmsHocTyRaduYGN7uSDywBaumzJIN/CfzqBkS9mlJBEZ2nunaQsiO
	i65Ma0Dx2AZHBq1Gp4fyrbFYgAEG3m9r5p92DCNESXCf2+IJCE0AKW+DUHwZE5pGdoZillYtUZQ
	+/PgKhO93BdaoMNjzownR+TBbcAJw6xqyxNQSaJKCrw3+ybUgj5YLyGVpGLkx2RVPZwIPzYPd9W
	37MGMT6EWv7vmBYdePWBwdqMKzsWRM7bKeanuNucOBhrSudkPqZQVLxAMR
X-Received: by 2002:a05:6512:31d6:b0:5a1:3e11:2963 with SMTP id 2adb3069b0e04-5a162b13fe6mr5199056e87.39.1773739817876;
        Tue, 17 Mar 2026 02:30:17 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm3977671e87.32.2026.03.17.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:30:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:30:14 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Arnd Bergmann <arnd@arndb.de>, Heiko Stuebner <heiko@sntech.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Alexandre Gonzalo <alexandre.gonzalo@arm.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in
 test
Message-ID: <abkfJsyQSbW-VjxD@nuoska>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,arm.com,glider.be,mobileye.com,bootlin.com,hansenpartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29566-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikko.rapeli@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[97];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,merge_config.sh:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF6E72A6CD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Mar 17, 2026 at 10:13:37AM +0100, Vincent Mailhol (Arm) wrote:
> merge_config.sh yields this warning:
> 
>   ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator
> 
> This happens because the script runs under /bin/sh but compares
> strings using the '==' operator, which is a bash extension. The POSIX
> test command only specifies '=' for string equality.
> 
> Replace '==' with the POSIX-compatible '=' so the script works when
> run with /bin/sh as intended.
> 
> Fixes: dfc97e1c5da5 ("scripts: kconfig: merge_config.sh: use awk in checks too")
> Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

This fix is already merged in kbuild trees:

https://lore.kernel.org/linux-kbuild/20260309121505.40454-1-o451686892@gmail.com/
https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git/log/?h=kbuild-fixes-for-next

Cheers,

-Mikko

> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 735e1de450c6..073c6bec5245 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -381,7 +381,7 @@ END {
>  	STRICT_MODE_VIOLATED=true
>  fi
>  
> -if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
> +if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
>  	echo "Requested and effective config differ"
>  	exit 1
>  fi
> 
> -- 
> 2.43.0
> 

