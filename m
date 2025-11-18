Return-Path: <linux-renesas-soc+bounces-24745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B3EC6B761
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 20:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F2293448A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 19:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDA42BE7C6;
	Tue, 18 Nov 2025 19:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bipWnB95"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7BF280A20;
	Tue, 18 Nov 2025 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494493; cv=none; b=XyYD9DtgN4/p/9DNk7IMqsiC8+xbUdHuakI8ta1uqkhAzNXa+MmvbrP3JCGzeaVFegBLziFBOvTkOlMz+E8jT5EERx/nguKCEbyUOPdK5y9lKQM6Q6v2G2agLPmx0dRdbhUzRnHKrK8adDkujVGGx4pOt7jT5dHesRl4UJ2xk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494493; c=relaxed/simple;
	bh=LW6fWFPpjQ+3M33MLrg0igBiyTEyXpbIFgsJVjAgQXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n63uNGfFRPtPA1ADniAdHMdpY4RwNP5mSj2L9GckfOh/A5NsXWHmpyizqAyHVW8fSHAYX6MpdX4OuaPaHUcE3gy7P7RR2irYzM6O5UgWwtoGgcjVleY/8gv/pjvl++J4Ebw+GJYRQlP3R7lkHR+SVbBiUMCVCRf+FMoUiZtvtvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bipWnB95; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F4DC16AAE;
	Tue, 18 Nov 2025 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763494492;
	bh=LW6fWFPpjQ+3M33MLrg0igBiyTEyXpbIFgsJVjAgQXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bipWnB95B03p++LsdQRJ1VkZDPgCiwdTwnkcc2PB4TVYF7cxo5ClgTuRVKjTx+LVh
	 VLta0ENkX3/NWod4z0IwGgUm90YSfmVphMLP0UwHF3VnFnydEBhzDt0GUe7DoDpVPl
	 qaVt1UaUaWuBxZQX35wYnZiTajtHYcAu4D0Z0SJP0USN2RnkfRRrCQUBd5Jaqd5ikN
	 h43ucPDr2alAqKL8JsMWnLdWYFvONXWAsN8H0cEj1kFfUjYZ+h2J2LA9zvS6TZs92K
	 uCKPgJCRoNFmzrrTfd7ATPi3ga2J31zIqFwOlvkCjyXmZMcY9wRRwT+3AeDOms6lTY
	 0/OQ1OdZzWPIw==
Date: Tue, 18 Nov 2025 19:34:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjRuHmLq8WplDRdP"
Content-Disposition: inline
In-Reply-To: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
X-Cookie: Sic transit gloria Monday!


--mjRuHmLq8WplDRdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> The Devicetree Specification states:
>=20
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
>=20
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:

I'm seeing a boot regression on the TI x15 platform in -next which
bisects to this patch in -next, unfortunately even with earlycon (though
just earlycon, I don't know the platform specific runes) the board just
dies with no output:

  https://validation.linaro.org/scheduler/job/4252918#L409

It does seem like a plausible patch for this sort of issue though, and
the bisect converges smoothly:

# bad: [187dac290bfd0741b9d7d5490af825c33fd9baa4] Add linux-next specific f=
iles for 20251118
# good: [17bfd0eea14a5f4217041fc57d85c965b07c02a8] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [118eb2cb97b8fc0d515bb0449495959247db58f0] spi: bcm63xx: drop wrong=
 casts in probe()
# good: [6402ddf3027d8975f135cf2b2014d6bbeb2d3436] MAINTAINERS: refer to tr=
ivial-codec.yaml in relevant sections
# good: [059f545832be85d29ac9ccc416a16f647aa78485] spi: add support for mic=
rochip "soft" spi controller
# good: [8ff3dcb0e8a8bf6c41f23ed4aa62d066d3948a10] ASoC: codecs: lpass-rx-m=
acro: add SM6115 compatible
# good: [e65b871c9b5af9265aefc5b8cd34993586d93aab] ASoC: codecs: pm4125: Re=
move irq_chip on component unbind
# good: [8d63e85c5b50f1dbfa0ccb214bd91fe5d7e2e860] firmware: cs_dsp: fix ke=
rnel-doc warnings in a header file
# good: [4e00135b2dd1d7924a58bffa551b6ceb3bd836f2] spi: spi-cadence: suppor=
ts transmission with bits_per_word of 16 and 32
# good: [123cd174a3782307787268adf45f22de4d290128] ASoC: Intel: atom: Repla=
ce strcpy() with strscpy()
# good: [1d562ba0aa7df81335bf96c02be77efe8d5bab87] spi: dt-bindings: nuvoto=
n,npcm-pspi: Convert to DT schema
# good: [4d6e2211aeb932e096f673c88475016b1cc0f8ab] ASoC: Intel: boards: fix=
 HDMI playback lookup when HDMI-In capture used
# good: [b3a5302484033331af37569f7277d00131694b57] ASoC: Intel: sof_rt5682:=
 Add quirk override support
# good: [873bc94689d832878befbcadc10b6ad5bb4e0027] ASoC: Intel: sof_sdw: ad=
d codec speaker support for the SKU
# good: [32172cf3cb543a04c41a1677c97a38e60cad05b6] ASoC: cs35l56: Allow res=
toring factory calibration through ALSA control
# good: [772ada50282b0c80343c8989147db816961f571d] ASoC: cs35l56: Alter err=
or codes for calibration routine
# good: [fb1ebb10468da414d57153ddebaab29c38ef1a78] regulator: core: disable=
 supply if enabling main regulator fails
# good: [6985defd1d832f1dd9d1977a6a2cc2cef7632704] regmap: sdw-mbq: Reorder=
 regmap_mbq_context struct for better packing
# good: [2089f086303b773e181567fd8d5df3038bd85937] regulator: mt6363: Remov=
e unneeded semicolon
# good: [4e92abd0a11b91af3742197a9ca962c3c00d0948] spi: imx: add i.MX51 ECS=
PI target mode support
# good: [6951be397ca8b8b167c9f99b5a11c541148c38cb] ASoC: codecs: pm4125: re=
move duplicate code
# good: [abc9a349b87ac0fd3ba8787ca00971b59c2e1257] spi: fsl-qspi: support t=
he SpacemiT K1 SoC
# good: [55d03b5b5bdd04daf9a35ce49db18d8bb488dffb] spi: imx: remove CLK cal=
culation and check for target mode
# good: [1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69] ASoC: SDCA: support Q7.8=
 volume format
# good: [6bd1ad97eb790570c167d4de4ca59fbc9c33722a] regulator: pf9453: Fix k=
ernel doc for mux_poll()
# good: [655079ac8a7721ac215a0596e3f33b740e01144a] ASoC: qcom: q6asm: Use g=
uard() for spin locks
# good: [3c36965df80801344850388592e95033eceea05b] regulator: Add support f=
or MediaTek MT6363 SPMI PMIC Regulators
# good: [aa897ffc396b48cc39eee133b6b43175d0df9eb5] ASoC: dt-bindings: ti,pc=
m1862: convert to dtschema
# good: [2f538ef9f6f7c3d700c68536f21447dfc598f8c8] spi: aspeed: Use devm_io=
unmap() to unmap devm_ioremap() memory
# good: [380fd29d57abe6679d87ec56babe65ddc5873a37] spi: tegra210-quad: Chec=
k hardware status on timeout
# good: [af9c8092d84244ca54ffb590435735f788e7a170] regmap: i3c: Use ARRAY_S=
IZE()
# good: [c4e68959af66df525d71db619ffe44af9178bb22] ASoC: dt-bindings: ti,ta=
s2781: Add TAS5822 support
# good: [252abf2d07d33b1c70a59ba1c9395ba42bbd793e] regulator: Small cleanup=
 in of_get_regulation_constraints()
# good: [84194c66aaf78fed150edb217b9f341518b1cba2] ASoC: codecs: aw88261: p=
ass pointer directly instead of passing the address
# good: [2ecc8c089802e033d2e5204d21a9f467e2517df9] regulator: pf9453: remov=
e unused I2C_LT register
# good: [ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc] regcache: maple: Split -=
>populate() from ->init()
# good: [e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0] ASoC: soc-core: check op=
s & auto_selectable_formats in snd_soc_dai_get_fmt() to prevent dereference=
 error
# good: [f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce] ASoC: max98090/91: fixin=
g the stream index
# good: [6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3] ASoC: codec: wm8400: rep=
lace printk() calls with dev_*() device aware logging
# good: [ecd0de438c1f0ee86cf8f6d5047965a2a181444b] spi: tle62x0: Add newlin=
e to sysfs attribute output
# good: [cf6bf51b53252284bafc7377a4d8dbf10f048b4d] ASoC: cs4271: Add suppor=
t for the external mclk
# good: [20bcda681f8597e86070a4b3b12d1e4f541865d3] ASoC: codecs: va-macro: =
fix revision checking
# good: [8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce] ASoC: qcom: sc7280: make=
 use of common helpers
# good: [e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8] regmap: warn users about=
 uninitialized flat cache
# good: [28039efa4d8e8bbf98b066133a906bd4e307d496] MAINTAINERS: remove obso=
lete file entry in DIALOG SEMICONDUCTOR DRIVERS
# good: [66fecfa91deb536a12ddf3d878a99590d7900277] ASoC: spacemit: use `dep=
ends on` instead of `select`
# good: [f034c16a4663eaf3198dc18b201ba50533fb5b81] ASoC: spacemit: add fail=
ure check for spacemit_i2s_init_dai()
# good: [4a5ac6cd05a7e54f1585d7779464d6ed6272c134] ASoC: sun4i-spdif: Suppo=
rt SPDIF output on A523 family
# good: [4795375d8aa072e9aacb0b278e6203c6ca41816a] ASoC: cs-amp-lib-test: A=
dd test cases for cs_amp_set_efi_calibration_data()
# good: [ef042df96d0e1089764f39ede61bc8f140a4be00] ASoC: SDCA: Add HID butt=
on IRQ
# good: [4c33cef58965eb655a0ac8e243aa323581ec025f] regulator: pca9450: link=
 regulator inputs to supply groups
# good: [e7434adf0c53a84d548226304cdb41c8818da1cb] ASoC: cs530x: Add SPI bu=
s support for cs530x parts
# good: [01313661b248c5ba586acae09bff57077dbec0a5] regulator: Let raspberry=
pi drivers depend on ARM
# good: [e973dfe9259095fb509ab12658c68d46f0e439d7] ASoC: qcom: sm8250: add =
qrb2210-sndcard compatible string
# good: [d29479abaded34b2b1dab2e17efe96a65eba3d61] ASoC: renesas: fsi: Cons=
tify struct fsi_stream_handler
# good: [77a58ba7c64ccca20616aa03599766ccb0d1a330] spi: spi-mem: Trace exec=
_op
# good: [c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c] ASoC: sdw_utils: add nam=
e_prefix for rt1321 part id
# good: [310bf433c01f78e0756fd5056a43118a2f77318c] ASoC: max98090/91: fixin=
g a space
# good: [fd5ef3d69f8975bad16c437a337b5cb04c8217a2] spi: spi-qpic-snand: mak=
e qcom_spi_ecc_engine_ops_pipelined const
# good: [d054cc3a2ccfb19484f3b54d69b6e416832dc8f4] regulator: rpmh-regulato=
r: Add RPMH regulator support for PMR735D
# good: [2528c15f314ece50218d1273654f630d74109583] ASoC: max98090/91: addin=
g DAPM routing for digital output for max98091
# good: [638bae3fb225a708dc67db613af62f6d14c4eff4] ASoC: max98090/91: added=
 DAPM widget for digital output for max98091
# good: [ecba655bf54a661ffe078856cd8dbc898270e4b5] ASoC: fsl_aud2htx: add I=
EC958_SUBFRAME_LE format in supported list
# good: [7e1906643a7374529af74b013bba35e4fa4e6ffc] ASoC: codecs: va-macro: =
Clean up on error path in probe()
# good: [d742ebcfe524dc54023f7c520d2ed2e4b7203c19] ASoC: soc.h: remove snd_=
soc_kcontrol_component()
# good: [6658472a3e2de08197acfe099ba71ee0e2505ecf] ASoC: amd: amd_sdw: Prop=
agate the PCI subsystem Vendor and Device IDs
# good: [fce217449075d59b29052b8cdac567f0f3e22641] ASoC: spacemit: add i2s =
support for K1 SoC
# good: [0cc08c8130ac8f74419f99fe707dc193b7f79d86] spi: aspeed: Fix an IS_E=
RR() vs NULL bug in probe()
# good: [0743acf746a81e0460a56fd5ff847d97fa7eb370] spi: airoha: buffer must=
 be 0xff-ed before writing
# good: [15afe57a874eaf104bfbb61ec598fa31627f7b19] ASoC: dt-bindings: qcom:=
 Add Kaanapali LPASS macro codecs
# good: [1e570e77392f43a3cdab2849d1f81535f8a033e2] ASoC: mxs-saif: support =
usage with simple-audio-card
# good: [d77daa49085b067137d0adbe3263f75a7ee13a1b] spi: aspeed: fix spellin=
g mistake "triming" -> "trimming"
# good: [6621b0f118d500092f5f3d72ddddb22aeeb3c3a0] ASoC: codecs: rt5670: us=
e SOC_VALUE_ENUM_SINGLE_DECL for DAC2 L/R MX-1B
# good: [65efe5404d151767653c7b7dd39bd2e7ad532c2d] regulator: rpmh-regulato=
r: Add RPMH regulator support for Glymur
# good: [fb25114cd760c13cf177d9ac37837fafcc9657b5] regulator: sy7636a: add =
gpios and input regulator
# good: [433e294c3c5b5d2020085a0e36c1cb47b694690a] regulator: core: forward=
 undervoltage events downstream by default
# good: [0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4] ASoC: replace use of sys=
tem_wq with system_dfl_wq
# good: [7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd] ASoC: sof-function-topol=
ogy-lib: escalate the log when missing function topoplogy
# good: [b83fb1b14c06bdd765903ac852ba20a14e24f227] spi: offload: Add offset=
 parameter
# good: [9797329220a2c6622411eb9ecf6a35b24ce09d04] ASoC: sof-function-topol=
ogy-lib: escalate the log when missing function topoplogy
# good: [fe8cc44dd173cde5788ab4e3730ac61f3d316d9c] spi: dw: add target mode=
 support
# good: [4d410ba9aa275e7990a270f63ce436990ace1bea] dt-bindings: sound: Upda=
te ADMAIF bindings for tegra264
# good: [4412ab501677606436e5c49e41151a1e6eac7ac0] spi: dt-bindings: spi-qp=
ic-snand: Add IPQ5332 compatible
# good: [5e537031f322d55315cd384398b726a9a0748d47] ASoC: codecs: Fix the er=
ror of excessive semicolons
# good: [6277a486a7faaa6c87f4bf1d59a2de233a093248] regulator: dt-bindings: =
Convert Dialog DA9211 Regulators to DT schema
# good: [64d87ccfae3326a9561fe41dc6073064a083e0df] spi: aspeed: Only map ne=
cessary address window region
git bisect start '187dac290bfd0741b9d7d5490af825c33fd9baa4' '17bfd0eea14a5f=
4217041fc57d85c965b07c02a8' '118eb2cb97b8fc0d515bb0449495959247db58f0' '640=
2ddf3027d8975f135cf2b2014d6bbeb2d3436' '059f545832be85d29ac9ccc416a16f647aa=
78485' '8ff3dcb0e8a8bf6c41f23ed4aa62d066d3948a10' 'e65b871c9b5af9265aefc5b8=
cd34993586d93aab' '8d63e85c5b50f1dbfa0ccb214bd91fe5d7e2e860' '4e00135b2dd1d=
7924a58bffa551b6ceb3bd836f2' '123cd174a3782307787268adf45f22de4d290128' '1d=
562ba0aa7df81335bf96c02be77efe8d5bab87' '4d6e2211aeb932e096f673c88475016b1c=
c0f8ab' 'b3a5302484033331af37569f7277d00131694b57' '873bc94689d832878befbca=
dc10b6ad5bb4e0027' '32172cf3cb543a04c41a1677c97a38e60cad05b6' '772ada50282b=
0c80343c8989147db816961f571d' 'fb1ebb10468da414d57153ddebaab29c38ef1a78' '6=
985defd1d832f1dd9d1977a6a2cc2cef7632704' '2089f086303b773e181567fd8d5df3038=
bd85937' '4e92abd0a11b91af3742197a9ca962c3c00d0948' '6951be397ca8b8b167c9f9=
9b5a11c541148c38cb' 'abc9a349b87ac0fd3ba8787ca00971b59c2e1257' '55d03b5b5bd=
d04daf9a35ce49db18d8bb488dffb' '1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69' '=
6bd1ad97eb790570c167d4de4ca59fbc9c33722a' '655079ac8a7721ac215a0596e3f33b74=
0e01144a' '3c36965df80801344850388592e95033eceea05b' 'aa897ffc396b48cc39eee=
133b6b43175d0df9eb5' '2f538ef9f6f7c3d700c68536f21447dfc598f8c8' '380fd29d57=
abe6679d87ec56babe65ddc5873a37' 'af9c8092d84244ca54ffb590435735f788e7a170' =
'c4e68959af66df525d71db619ffe44af9178bb22' '252abf2d07d33b1c70a59ba1c9395ba=
42bbd793e' '84194c66aaf78fed150edb217b9f341518b1cba2' '2ecc8c089802e033d2e5=
204d21a9f467e2517df9' 'ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc' 'e73b743bf=
e8a6ff4e05b5657d3f7586a17ac3ba0' 'f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce'=
 '6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3' 'ecd0de438c1f0ee86cf8f6d5047965=
a2a181444b' 'cf6bf51b53252284bafc7377a4d8dbf10f048b4d' '20bcda681f8597e8607=
0a4b3b12d1e4f541865d3' '8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce' 'e062bdfd=
d6adbb2dee7751d054c1d8df63ddb8b8' '28039efa4d8e8bbf98b066133a906bd4e307d496=
' '66fecfa91deb536a12ddf3d878a99590d7900277' 'f034c16a4663eaf3198dc18b201ba=
50533fb5b81' '4a5ac6cd05a7e54f1585d7779464d6ed6272c134' '4795375d8aa072e9aa=
cb0b278e6203c6ca41816a' 'ef042df96d0e1089764f39ede61bc8f140a4be00' '4c33cef=
58965eb655a0ac8e243aa323581ec025f' 'e7434adf0c53a84d548226304cdb41c8818da1c=
b' '01313661b248c5ba586acae09bff57077dbec0a5' 'e973dfe9259095fb509ab12658c6=
8d46f0e439d7' 'd29479abaded34b2b1dab2e17efe96a65eba3d61' '77a58ba7c64ccca20=
616aa03599766ccb0d1a330' 'c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c' '310bf4=
33c01f78e0756fd5056a43118a2f77318c' 'fd5ef3d69f8975bad16c437a337b5cb04c8217=
a2' 'd054cc3a2ccfb19484f3b54d69b6e416832dc8f4' '2528c15f314ece50218d1273654=
f630d74109583' '638bae3fb225a708dc67db613af62f6d14c4eff4' 'ecba655bf54a661f=
fe078856cd8dbc898270e4b5' '7e1906643a7374529af74b013bba35e4fa4e6ffc' 'd742e=
bcfe524dc54023f7c520d2ed2e4b7203c19' '6658472a3e2de08197acfe099ba71ee0e2505=
ecf' 'fce217449075d59b29052b8cdac567f0f3e22641' '0cc08c8130ac8f74419f99fe70=
7dc193b7f79d86' '0743acf746a81e0460a56fd5ff847d97fa7eb370' '15afe57a874eaf1=
04bfbb61ec598fa31627f7b19' '1e570e77392f43a3cdab2849d1f81535f8a033e2' 'd77d=
aa49085b067137d0adbe3263f75a7ee13a1b' '6621b0f118d500092f5f3d72ddddb22aeeb3=
c3a0' '65efe5404d151767653c7b7dd39bd2e7ad532c2d' 'fb25114cd760c13cf177d9ac3=
7837fafcc9657b5' '433e294c3c5b5d2020085a0e36c1cb47b694690a' '0b0eb7702a9fa4=
10755e86124b4b7cd36e7d1cb4' '7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd' 'b83=
fb1b14c06bdd765903ac852ba20a14e24f227' '9797329220a2c6622411eb9ecf6a35b24ce=
09d04' 'fe8cc44dd173cde5788ab4e3730ac61f3d316d9c' '4d410ba9aa275e7990a270f6=
3ce436990ace1bea' '4412ab501677606436e5c49e41151a1e6eac7ac0' '5e537031f322d=
55315cd384398b726a9a0748d47' '6277a486a7faaa6c87f4bf1d59a2de233a093248' '64=
d87ccfae3326a9561fe41dc6073064a083e0df'
# test job: [118eb2cb97b8fc0d515bb0449495959247db58f0] https://validation.l=
inaro.org/scheduler/job/4251562
# test job: [6402ddf3027d8975f135cf2b2014d6bbeb2d3436] https://validation.l=
inaro.org/scheduler/job/4250130
# test job: [059f545832be85d29ac9ccc416a16f647aa78485] https://validation.l=
inaro.org/scheduler/job/4250135
# test job: [8ff3dcb0e8a8bf6c41f23ed4aa62d066d3948a10] https://validation.l=
inaro.org/scheduler/job/4249404
# test job: [e65b871c9b5af9265aefc5b8cd34993586d93aab] https://validation.l=
inaro.org/scheduler/job/4249436
# test job: [8d63e85c5b50f1dbfa0ccb214bd91fe5d7e2e860] https://validation.l=
inaro.org/scheduler/job/4249382
# test job: [4e00135b2dd1d7924a58bffa551b6ceb3bd836f2] https://validation.l=
inaro.org/scheduler/job/4249372
# test job: [123cd174a3782307787268adf45f22de4d290128] https://validation.l=
inaro.org/scheduler/job/4248594
# test job: [1d562ba0aa7df81335bf96c02be77efe8d5bab87] https://validation.l=
inaro.org/scheduler/job/4248411
# test job: [4d6e2211aeb932e096f673c88475016b1cc0f8ab] https://validation.l=
inaro.org/scheduler/job/4248309
# test job: [b3a5302484033331af37569f7277d00131694b57] https://validation.l=
inaro.org/scheduler/job/4247474
# test job: [873bc94689d832878befbcadc10b6ad5bb4e0027] https://validation.l=
inaro.org/scheduler/job/4247503
# test job: [32172cf3cb543a04c41a1677c97a38e60cad05b6] https://validation.l=
inaro.org/scheduler/job/4247546
# test job: [772ada50282b0c80343c8989147db816961f571d] https://validation.l=
inaro.org/scheduler/job/4247196
# test job: [fb1ebb10468da414d57153ddebaab29c38ef1a78] https://validation.l=
inaro.org/scheduler/job/4245804
# test job: [6985defd1d832f1dd9d1977a6a2cc2cef7632704] https://validation.l=
inaro.org/scheduler/job/4245678
# test job: [2089f086303b773e181567fd8d5df3038bd85937] https://validation.l=
inaro.org/scheduler/job/4245579
# test job: [4e92abd0a11b91af3742197a9ca962c3c00d0948] https://validation.l=
inaro.org/scheduler/job/4245229
# test job: [6951be397ca8b8b167c9f99b5a11c541148c38cb] https://validation.l=
inaro.org/scheduler/job/4245247
# test job: [abc9a349b87ac0fd3ba8787ca00971b59c2e1257] https://validation.l=
inaro.org/scheduler/job/4245043
# test job: [55d03b5b5bdd04daf9a35ce49db18d8bb488dffb] https://validation.l=
inaro.org/scheduler/job/4244859
# test job: [1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69] https://validation.l=
inaro.org/scheduler/job/4244844
# test job: [6bd1ad97eb790570c167d4de4ca59fbc9c33722a] https://validation.l=
inaro.org/scheduler/job/4244833
# test job: [655079ac8a7721ac215a0596e3f33b740e01144a] https://validation.l=
inaro.org/scheduler/job/4244098
# test job: [3c36965df80801344850388592e95033eceea05b] https://validation.l=
inaro.org/scheduler/job/4244070
# test job: [aa897ffc396b48cc39eee133b6b43175d0df9eb5] https://validation.l=
inaro.org/scheduler/job/4243918
# test job: [2f538ef9f6f7c3d700c68536f21447dfc598f8c8] https://validation.l=
inaro.org/scheduler/job/4243935
# test job: [380fd29d57abe6679d87ec56babe65ddc5873a37] https://validation.l=
inaro.org/scheduler/job/4243320
# test job: [af9c8092d84244ca54ffb590435735f788e7a170] https://validation.l=
inaro.org/scheduler/job/4243186
# test job: [c4e68959af66df525d71db619ffe44af9178bb22] https://validation.l=
inaro.org/scheduler/job/4243228
# test job: [252abf2d07d33b1c70a59ba1c9395ba42bbd793e] https://validation.l=
inaro.org/scheduler/job/4242467
# test job: [84194c66aaf78fed150edb217b9f341518b1cba2] https://validation.l=
inaro.org/scheduler/job/4242482
# test job: [2ecc8c089802e033d2e5204d21a9f467e2517df9] https://validation.l=
inaro.org/scheduler/job/4242496
# test job: [ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc] https://validation.l=
inaro.org/scheduler/job/4241654
# test job: [e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0] https://validation.l=
inaro.org/scheduler/job/4241465
# test job: [f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce] https://validation.l=
inaro.org/scheduler/job/4241357
# test job: [6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3] https://validation.l=
inaro.org/scheduler/job/4241404
# test job: [ecd0de438c1f0ee86cf8f6d5047965a2a181444b] https://validation.l=
inaro.org/scheduler/job/4241425
# test job: [cf6bf51b53252284bafc7377a4d8dbf10f048b4d] https://validation.l=
inaro.org/scheduler/job/4240943
# test job: [20bcda681f8597e86070a4b3b12d1e4f541865d3] https://validation.l=
inaro.org/scheduler/job/4240924
# test job: [8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce] https://validation.l=
inaro.org/scheduler/job/4240624
# test job: [e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8] https://validation.l=
inaro.org/scheduler/job/4240493
# test job: [28039efa4d8e8bbf98b066133a906bd4e307d496] https://validation.l=
inaro.org/scheduler/job/4240522
# test job: [66fecfa91deb536a12ddf3d878a99590d7900277] https://validation.l=
inaro.org/scheduler/job/4239582
# test job: [f034c16a4663eaf3198dc18b201ba50533fb5b81] https://validation.l=
inaro.org/scheduler/job/4239593
# test job: [4a5ac6cd05a7e54f1585d7779464d6ed6272c134] https://validation.l=
inaro.org/scheduler/job/4238922
# test job: [4795375d8aa072e9aacb0b278e6203c6ca41816a] https://validation.l=
inaro.org/scheduler/job/4238773
# test job: [ef042df96d0e1089764f39ede61bc8f140a4be00] https://validation.l=
inaro.org/scheduler/job/4238839
# test job: [4c33cef58965eb655a0ac8e243aa323581ec025f] https://validation.l=
inaro.org/scheduler/job/4238733
# test job: [e7434adf0c53a84d548226304cdb41c8818da1cb] https://validation.l=
inaro.org/scheduler/job/4238583
# test job: [01313661b248c5ba586acae09bff57077dbec0a5] https://validation.l=
inaro.org/scheduler/job/4238700
# test job: [e973dfe9259095fb509ab12658c68d46f0e439d7] https://validation.l=
inaro.org/scheduler/job/4238521
# test job: [d29479abaded34b2b1dab2e17efe96a65eba3d61] https://validation.l=
inaro.org/scheduler/job/4238669
# test job: [77a58ba7c64ccca20616aa03599766ccb0d1a330] https://validation.l=
inaro.org/scheduler/job/4238590
# test job: [c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c] https://validation.l=
inaro.org/scheduler/job/4237520
# test job: [310bf433c01f78e0756fd5056a43118a2f77318c] https://validation.l=
inaro.org/scheduler/job/4236581
# test job: [fd5ef3d69f8975bad16c437a337b5cb04c8217a2] https://validation.l=
inaro.org/scheduler/job/4236659
# test job: [d054cc3a2ccfb19484f3b54d69b6e416832dc8f4] https://validation.l=
inaro.org/scheduler/job/4236595
# test job: [2528c15f314ece50218d1273654f630d74109583] https://validation.l=
inaro.org/scheduler/job/4236983
# test job: [638bae3fb225a708dc67db613af62f6d14c4eff4] https://validation.l=
inaro.org/scheduler/job/4235786
# test job: [ecba655bf54a661ffe078856cd8dbc898270e4b5] https://validation.l=
inaro.org/scheduler/job/4234816
# test job: [7e1906643a7374529af74b013bba35e4fa4e6ffc] https://validation.l=
inaro.org/scheduler/job/4234520
# test job: [d742ebcfe524dc54023f7c520d2ed2e4b7203c19] https://validation.l=
inaro.org/scheduler/job/4234425
# test job: [6658472a3e2de08197acfe099ba71ee0e2505ecf] https://validation.l=
inaro.org/scheduler/job/4234322
# test job: [fce217449075d59b29052b8cdac567f0f3e22641] https://validation.l=
inaro.org/scheduler/job/4234379
# test job: [0cc08c8130ac8f74419f99fe707dc193b7f79d86] https://validation.l=
inaro.org/scheduler/job/4233218
# test job: [0743acf746a81e0460a56fd5ff847d97fa7eb370] https://validation.l=
inaro.org/scheduler/job/4233092
# test job: [15afe57a874eaf104bfbb61ec598fa31627f7b19] https://validation.l=
inaro.org/scheduler/job/4232523
# test job: [1e570e77392f43a3cdab2849d1f81535f8a033e2] https://validation.l=
inaro.org/scheduler/job/4232401
# test job: [d77daa49085b067137d0adbe3263f75a7ee13a1b] https://validation.l=
inaro.org/scheduler/job/4232519
# test job: [6621b0f118d500092f5f3d72ddddb22aeeb3c3a0] https://validation.l=
inaro.org/scheduler/job/4231619
# test job: [65efe5404d151767653c7b7dd39bd2e7ad532c2d] https://validation.l=
inaro.org/scheduler/job/4231654
# test job: [fb25114cd760c13cf177d9ac37837fafcc9657b5] https://validation.l=
inaro.org/scheduler/job/4231716
# test job: [433e294c3c5b5d2020085a0e36c1cb47b694690a] https://validation.l=
inaro.org/scheduler/job/4231186
# test job: [0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4] https://validation.l=
inaro.org/scheduler/job/4231214
# test job: [7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd] https://validation.l=
inaro.org/scheduler/job/4230437
# test job: [b83fb1b14c06bdd765903ac852ba20a14e24f227] https://validation.l=
inaro.org/scheduler/job/4229399
# test job: [9797329220a2c6622411eb9ecf6a35b24ce09d04] https://validation.l=
inaro.org/scheduler/job/4229427
# test job: [fe8cc44dd173cde5788ab4e3730ac61f3d316d9c] https://validation.l=
inaro.org/scheduler/job/4229310
# test job: [4d410ba9aa275e7990a270f63ce436990ace1bea] https://validation.l=
inaro.org/scheduler/job/4229571
# test job: [4412ab501677606436e5c49e41151a1e6eac7ac0] https://validation.l=
inaro.org/scheduler/job/4229373
# test job: [5e537031f322d55315cd384398b726a9a0748d47] https://validation.l=
inaro.org/scheduler/job/4229363
# test job: [6277a486a7faaa6c87f4bf1d59a2de233a093248] https://validation.l=
inaro.org/scheduler/job/4229446
# test job: [64d87ccfae3326a9561fe41dc6073064a083e0df] https://validation.l=
inaro.org/scheduler/job/4229383
# test job: [187dac290bfd0741b9d7d5490af825c33fd9baa4] https://validation.l=
inaro.org/scheduler/job/4252522
# bad: [187dac290bfd0741b9d7d5490af825c33fd9baa4] Add linux-next specific f=
iles for 20251118
git bisect bad 187dac290bfd0741b9d7d5490af825c33fd9baa4
# test job: [abb54b0b86a61f10649f9ef3f6ab6821ae6abe74] https://validation.l=
inaro.org/scheduler/job/4252538
# good: [abb54b0b86a61f10649f9ef3f6ab6821ae6abe74] Merge branch 'master' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.g=
it
git bisect good abb54b0b86a61f10649f9ef3f6ab6821ae6abe74
# test job: [ad048b22af91649db0797904f7452bbd082c4f72] https://validation.l=
inaro.org/scheduler/job/4252547
# good: [ad048b22af91649db0797904f7452bbd082c4f72] Merge branch 'for-backli=
ght-next' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.=
git
git bisect good ad048b22af91649db0797904f7452bbd082c4f72
# test job: [2eb38aa81687e8bde227a4be8bc16aaea024b41a] https://validation.l=
inaro.org/scheduler/job/4252637
# bad: [2eb38aa81687e8bde227a4be8bc16aaea024b41a] Merge branch 'driver-core=
-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git
git bisect bad 2eb38aa81687e8bde227a4be8bc16aaea024b41a
# test job: [e14a1dc8cc9a22783d72c1391379862e746240ed] https://validation.l=
inaro.org/scheduler/job/4252684
# bad: [e14a1dc8cc9a22783d72c1391379862e746240ed] Merge branch 'master' of =
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect bad e14a1dc8cc9a22783d72c1391379862e746240ed
# test job: [2100c369e967e5cb7dd4071f9b0076df4a0cc10d] https://validation.l=
inaro.org/scheduler/job/4252695
# good: [2100c369e967e5cb7dd4071f9b0076df4a0cc10d] Merge branch into tip/ma=
ster: 'ras/core'
git bisect good 2100c369e967e5cb7dd4071f9b0076df4a0cc10d
# test job: [86739f0246e40a3bdc0e5cdcceee3f054c2f618a] https://validation.l=
inaro.org/scheduler/job/4252700
# good: [86739f0246e40a3bdc0e5cdcceee3f054c2f618a] Merge branch 'next' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
git bisect good 86739f0246e40a3bdc0e5cdcceee3f054c2f618a
# test job: [96b778038bba9d6f53a3bbaaf117eb5ba34eb386] https://validation.l=
inaro.org/scheduler/job/4252709
# good: [96b778038bba9d6f53a3bbaaf117eb5ba34eb386] Merge branch into tip/ma=
ster: 'x86/core'
git bisect good 96b778038bba9d6f53a3bbaaf117eb5ba34eb386
# test job: [6f85aad74a70d17919a64ecd93037aa51c08698d] https://validation.l=
inaro.org/scheduler/job/4252719
# good: [6f85aad74a70d17919a64ecd93037aa51c08698d] Merge branch into tip/ma=
ster: 'x86/sgx'
git bisect good 6f85aad74a70d17919a64ecd93037aa51c08698d
# test job: [bcc357c8e0614939352e3b72bbfd79c27e0bf10a] https://validation.l=
inaro.org/scheduler/job/4252721
# good: [bcc357c8e0614939352e3b72bbfd79c27e0bf10a] dt-bindings: Update Krzy=
sztof Kozlowski's email
git bisect good bcc357c8e0614939352e3b72bbfd79c27e0bf10a
# test job: [1b1f04d8271e7ba70fbbb13754b1e869f70aa785] https://validation.l=
inaro.org/scheduler/job/4252790
# bad: [1b1f04d8271e7ba70fbbb13754b1e869f70aa785] of/irq: Ignore interrupt =
parent for nodes without interrupts
git bisect bad 1b1f04d8271e7ba70fbbb13754b1e869f70aa785
# test job: [3c09ca88c61d3af2141667ffa691009c9e2cef1c] https://validation.l=
inaro.org/scheduler/job/4252822
# good: [3c09ca88c61d3af2141667ffa691009c9e2cef1c] dt-bindings: thermal: Co=
nvert amazon,al-thermal to DT schema
git bisect good 3c09ca88c61d3af2141667ffa691009c9e2cef1c
# test job: [a18b0c924870c050222c71c2b3a8fb341a21f961] https://validation.l=
inaro.org/scheduler/job/4252842
# good: [a18b0c924870c050222c71c2b3a8fb341a21f961] dt-bindings: thermal: Dr=
op db8500-thermal.txt
git bisect good a18b0c924870c050222c71c2b3a8fb341a21f961
# test job: [c7496597adbd85fb1d7293d2938ba21f12c212e4] https://validation.l=
inaro.org/scheduler/job/4252858
# good: [c7496597adbd85fb1d7293d2938ba21f12c212e4] of/address: Remove the i=
ncorrect and misleading comment
git bisect good c7496597adbd85fb1d7293d2938ba21f12c212e4
# first bad commit: [1b1f04d8271e7ba70fbbb13754b1e869f70aa785] of/irq: Igno=
re interrupt parent for nodes without interrupts

--mjRuHmLq8WplDRdP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkcylMACgkQJNaLcl1U
h9Bz3Af/UXuIkSXg4ukAUOwxVYgcyxUXebXdyMMUXyfeDW7uixlPmcZt5n0PPqeP
g58XjD/3fM0DX2z9gjrrwxUlclUk3CBkVVP94y+Gxx9n1fzYrgIWAWF+Icw9CRW1
9HmSrdnusp4u1PWFRWgevA5QusxutCwxGBUbgomi0OkoTCt/laADIN+FPKqbZ7u2
87XChUxynqcGJ3AR8ucxxZizHnUxiQC2eXIczDN03AUntJvmP2qJxic3dQSVg4dx
t9EKipO5VWwHv27p+DcT4Nuo1iMKS4HSOq/Qnlg+6tPgGvhFfbeATCrFilWNsDyW
Pgtzl5adRZIakaXPHcEr08nt+2tlDA==
=JP4E
-----END PGP SIGNATURE-----

--mjRuHmLq8WplDRdP--

