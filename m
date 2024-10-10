Return-Path: <linux-renesas-soc+bounces-9670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8C999507
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 00:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08E96B210C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 22:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556351BD01D;
	Thu, 10 Oct 2024 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8e+rPHz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4291BBBC4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Oct 2024 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728598769; cv=none; b=gqFvwsdYQ8N+fsLpgdegvtGvV7IHTfLCYXqbb9o8Nulr9/Li+gmvSQk0sSIGumhBGjASC8HB/eg/OHi+lKACbKGKkMAZ2o+q9ARJtjwqw7PTHc+T0JOKTimOpuHTZXR95KEu3p/ewFBuqVgZ6tEawz4jm+rGMdOXMiGuGDhoOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728598769; c=relaxed/simple;
	bh=XHKEY/KMQMmlW4b4wnIHt+tEBzCN5Mrh1e8Giv3Qrlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKybL6AXFj/ccmGk3PrMU9ByXRMxB5sWGyPje9zmubTa4LC4Qfi63KC/c45TqaggPlCtHlyYOGXFu1B1IX9/qFtg5px/6Oc2AiqR57u+P/q7oIxIElODeSGdqOZvH9O8s1gTUjCzmp15JESmELRKQBol6ZBV1VrvzDSWBl1Wlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8e+rPHz; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50a5a72b935so406957e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Oct 2024 15:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728598766; x=1729203566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ModY1fxzFDzBEAFE8C5DWu6JAPC+uwWG7R/rBXtgKY4=;
        b=H8e+rPHzQ5hx8vcC4chIx2POV78xV0Adob77QEn/eJZO8+jroYpwBPtRr+S9UT84+f
         kJdwsvekq/ZlMsUOUJuwET7Z4veurbrTQA9dahOk18tx3xPo4Fzj274IFsIsjUbJUQol
         bQ5NA8oxjGvbMGHvjI1Ad1NnN6tLPWGLxpXhd3cB5REyd7QNJ/jbjocJlq13by26HMei
         7F+g3f4NcCpHP/nR3rpIPBsTq9sJ00j0+p+bX0CIzriZGnvNhlSAjD9vRab/7dibktqy
         UrP9PRnaJxXxxQFZCPjN1Dov9JHBaOHX0CSRTwqDyzdCmVHdHELimxSN8L3Ir2pwJvTm
         IiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728598766; x=1729203566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ModY1fxzFDzBEAFE8C5DWu6JAPC+uwWG7R/rBXtgKY4=;
        b=AdjPXz2xi7AJPUBJvwcHvu8YqdhEZef21XAWETOmxwW7XTg+zm5DwLa55xhLsbnIgq
         wwk+ZnHlK5uZiBcTuMd2uaCc/ddQaU4hBFkyu1K8Y0sEgmJYFwqby6RTVGVSwxLMgB/G
         oT5FnI73EFT0SvSEK0Vx0fnkWQS9LiF6OsMeZSElfHIwu4QoAd3NPEiGAbleXgjc1mS2
         MMFZ3PjSudOyp/TXaip4UywRnJt0YG7Bgf2kllzPtvXS1IZkxKicuB1SoLaU33ms5lrv
         PwboBS9WPa6BlaB75nMKIN9OvbHeVrVu+gAXlLNiijCr0rA9ebyGcYCaUipX06MMxRJk
         DyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkDvjrSJMdo75TSq+bc/2f23OEPXqzpQ1NaCItHqcJ0BFAu1D/3MNSTcctwJTgexPn2D1mrpXi6nx1SMOzM7KkRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJqRLkk0C1aoXj529PoaRd7EkyzTG1fFLELn3X+9ZwSC9FbfgE
	6oK3XuhmjK6Yl/JibC0nAg2VMtu00jADbXiH1i/RqftLX2mt8bcueXOkj5l6Oi0tz47KdcGK1Im
	JmWO00rT5TtIxKN2xlm6r1G7BWN0=
X-Google-Smtp-Source: AGHT+IGGcpVoOJGvEA+MY7Vv3GowbQYNsNregnHpVfZDY82bhXC81j9b++sEgObUUfFSWopkXREiNx7vZxFjVMe3L3A=
X-Received: by 2002:a05:6122:910:b0:50a:bd10:e9a5 with SMTP id
 71dfb90a1353d-50d1f3b9ad5mr351382e0c.4.1728598766235; Thu, 10 Oct 2024
 15:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
In-Reply-To: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 10 Oct 2024 23:19:00 +0100
Message-ID: <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com>
Subject: Re: [PATCH LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Oct 3, 2024 at 1:36=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> RZ/Five cannot be supported by the standard RISC-V defconfig due to its
> dependency on NONPORTABLE.  Hence add a separate defconfig for Renesas
> RZ/Five boards.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream integration.
> To be applied to my topic/renesas-defconfig branch, which already has
> arch/arm64/configs/renesas_defconfig.
>
> Tested with OpenEmbedded nodistro.0 smarc-rzfive (eMMC and nfsroot).
>
> Any other options that should be enabled/disabled?

diff --git a/arch/riscv/configs/rzfive_defconfig
b/arch/riscv/configs/rzfive_defconfig
index 31483a1d520c..82709dd712e5 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -3,6 +3,7 @@ CONFIG_POSIX_MQUEUE=3Dy
 CONFIG_NO_HZ_IDLE=3Dy
 CONFIG_HIGH_RES_TIMERS=3Dy
 CONFIG_BPF_SYSCALL=3Dy
+CONFIG_PREEMPT=3Dy
 CONFIG_IKCONFIG=3Dy
 CONFIG_IKCONFIG_PROC=3Dy
 CONFIG_CGROUPS=3Dy
@@ -57,11 +58,7 @@ CONFIG_CAN=3Dy
 CONFIG_NET_9P=3Dy
 CONFIG_NET_9P_VIRTIO=3Dy
 CONFIG_PAGE_POOL_STATS=3Dy
-CONFIG_PCI=3Dy
-CONFIG_PCIEPORTBUS=3Dy
-CONFIG_PCI_HOST_GENERIC=3Dy
-CONFIG_PCIE_XILINX=3Dy
-CONFIG_PCIE_MICROCHIP_HOST=3Dy
+# CONFIG_PCI is not set
 CONFIG_DEVTMPFS=3Dy
 CONFIG_DEVTMPFS_MOUNT=3Dy
 CONFIG_MTD=3Dy
@@ -124,6 +121,7 @@ CONFIG_MFD_DA9062=3Dy
 CONFIG_RZ_MTU3=3Dy
 CONFIG_REGULATOR=3Dy
 CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
+CONFIG_REGULATOR_GPIO=3Dy
 CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
 CONFIG_SOUND=3Dy
 CONFIG_SND=3Dy
@@ -141,8 +139,7 @@ CONFIG_SND_SOC_WM8978=3Dy
 CONFIG_SND_SIMPLE_CARD=3Dy
 CONFIG_USB=3Dy
 CONFIG_USB_OTG=3Dy
-CONFIG_USB_XHCI_HCD=3Dy
-CONFIG_USB_XHCI_PLATFORM=3Dy
+# CONFIG_USB_XHCI_HCD is not set
 CONFIG_USB_EHCI_HCD=3Dy
 CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
 CONFIG_USB_OHCI_HCD=3Dy
@@ -210,6 +207,7 @@ CONFIG_DEBUG_MEMORY_INIT=3Dy
 CONFIG_SOFTLOCKUP_DETECTOR=3Dy
 CONFIG_WQ_WATCHDOG=3Dy
 CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
+# CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_TIMEKEEPING=3Dy
 CONFIG_DEBUG_RT_MUTEXES=3Dy
 CONFIG_DEBUG_SPINLOCK=3Dy

For some reason when CONFIG_SCHED_DEBUG is enabled, the USB host on
CN1 isn't working!

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> Thanks for your comments!
> ---
>  MAINTAINERS                         |   3 +
>  arch/riscv/configs/rzfive_defconfig | 224 ++++++++++++++++++++++++++++
>  2 files changed, 227 insertions(+)
>  create mode 100644 arch/riscv/configs/rzfive_defconfig
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a2aa2a1be720821..bf313685817e5228 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2924,6 +2924,7 @@ F:        arch/arm/mach-shmobile/
>  F:     arch/arm64/boot/dts/renesas/
>  F:     arch/arm64/configs/renesas_defconfig
>  F:     arch/riscv/boot/dts/renesas/
> +F:     arch/riscv/configs/rzfive_defconfig
>  F:     drivers/pmdomain/renesas/
>  F:     drivers/soc/renesas/
>  F:     include/linux/soc/renesas/
> @@ -19880,6 +19881,7 @@ C:      irc://irc.libera.chat/riscv
>  P:     Documentation/arch/riscv/patch-acceptance.rst
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>  F:     arch/riscv/
> +X:     arch/riscv/configs/rzfive_defconfig
>  N:     riscv
>  K:     riscv
>
> @@ -25752,3 +25754,4 @@ T:      git git://git.kernel.org/pub/scm/linux/ke=
rnel/git/torvalds/linux.git
>  F:     *
>  F:     */
>  X:     arch/arm64/configs/renesas_defconfig
> +X:     arch/riscv/configs/rzfive_defconfig
> diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzf=
ive_defconfig
> new file mode 100644
> index 0000000000000000..31483a1d520cb124
> --- /dev/null
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -0,0 +1,224 @@
> +CONFIG_SYSVIPC=3Dy
> +CONFIG_POSIX_MQUEUE=3Dy
> +CONFIG_NO_HZ_IDLE=3Dy
> +CONFIG_HIGH_RES_TIMERS=3Dy
> +CONFIG_BPF_SYSCALL=3Dy
> +CONFIG_IKCONFIG=3Dy
> +CONFIG_IKCONFIG_PROC=3Dy
> +CONFIG_CGROUPS=3Dy
> +CONFIG_MEMCG=3Dy
> +CONFIG_CGROUP_SCHED=3Dy
> +CONFIG_CFS_BANDWIDTH=3Dy
> +CONFIG_RT_GROUP_SCHED=3Dy
> +CONFIG_CGROUP_PIDS=3Dy
> +CONFIG_CGROUP_FREEZER=3Dy
> +CONFIG_CGROUP_HUGETLB=3Dy
> +CONFIG_CGROUP_DEVICE=3Dy
> +CONFIG_CGROUP_CPUACCT=3Dy
> +CONFIG_CGROUP_PERF=3Dy
> +CONFIG_CGROUP_BPF=3Dy
> +CONFIG_NAMESPACES=3Dy
> +CONFIG_USER_NS=3Dy
> +CONFIG_CHECKPOINT_RESTORE=3Dy
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> +CONFIG_EXPERT=3Dy
> +# CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PROFILING=3Dy
> +CONFIG_ARCH_RENESAS=3Dy
> +CONFIG_ERRATA_SIFIVE=3Dy
> +CONFIG_NONPORTABLE=3Dy
> +# CONFIG_RISCV_ISA_ZICBOM is not set
> +# CONFIG_EFI is not set
> +CONFIG_PM_AUTOSLEEP=3Dy
> +CONFIG_CPU_IDLE=3Dy
> +CONFIG_RISCV_SBI_CPUIDLE=3Dy
> +CONFIG_CPU_FREQ=3Dy
> +CONFIG_CPU_FREQ_STAT=3Dy
> +CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> +CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> +CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> +CONFIG_CPUFREQ_DT=3Dy
> +CONFIG_JUMP_LABEL=3Dy
> +CONFIG_SLAB_FREELIST_HARDENED=3Dy
> +CONFIG_NET=3Dy
> +CONFIG_PACKET=3Dy
> +CONFIG_IP_MULTICAST=3Dy
> +CONFIG_IP_ADVANCED_ROUTER=3Dy
> +CONFIG_IP_PNP=3Dy
> +CONFIG_IP_PNP_DHCP=3Dy
> +CONFIG_IP_PNP_BOOTP=3Dy
> +CONFIG_IP_PNP_RARP=3Dy
> +CONFIG_NETFILTER=3Dy
> +CONFIG_NET_SCHED=3Dy
> +CONFIG_NETLINK_DIAG=3Dy
> +CONFIG_CGROUP_NET_PRIO=3Dy
> +CONFIG_CAN=3Dy
> +CONFIG_NET_9P=3Dy
> +CONFIG_NET_9P_VIRTIO=3Dy
> +CONFIG_PAGE_POOL_STATS=3Dy
> +CONFIG_PCI=3Dy
> +CONFIG_PCIEPORTBUS=3Dy
> +CONFIG_PCI_HOST_GENERIC=3Dy
> +CONFIG_PCIE_XILINX=3Dy
> +CONFIG_PCIE_MICROCHIP_HOST=3Dy
> +CONFIG_DEVTMPFS=3Dy
> +CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +# CONFIG_MTD_OF_PARTS is not set
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_CFI=3Dy
> +CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> +CONFIG_MTD_SPI_NOR=3Dy
> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> +CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_VIRTIO_BLK=3Dy
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_BLK_DEV_SR=3Dy
> +CONFIG_SCSI_VIRTIO=3Dy
> +CONFIG_ATA=3Dy
> +CONFIG_SATA_AHCI=3Dy
> +CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> +CONFIG_SATA_AHCI_PLATFORM=3Dy
> +CONFIG_MD=3Dy
> +CONFIG_NETDEVICES=3Dy
> +CONFIG_VIRTIO_NET=3Dy
> +CONFIG_R8169=3Dy
> +CONFIG_RAVB=3Dy
> +CONFIG_MICREL_PHY=3Dy
> +CONFIG_MICROSEMI_PHY=3Dy
> +CONFIG_VITESSE_PHY=3Dy
> +CONFIG_CAN_RCAR_CANFD=3Dy
> +CONFIG_INPUT_MOUSEDEV=3Dy
> +# CONFIG_KEYBOARD_ATKBD is not set
> +# CONFIG_MOUSE_PS2 is not set
> +CONFIG_INPUT_MISC=3Dy
> +CONFIG_INPUT_DA9063_ONKEY=3Dy
> +CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> +CONFIG_SERIAL_SH_SCI=3Dy
> +CONFIG_HVC_RISCV_SBI=3Dy
> +CONFIG_VIRTIO_CONSOLE=3Dy
> +CONFIG_HW_RANDOM_VIRTIO=3Dy
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_I2C_RIIC=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_RPCIF=3Dy
> +CONFIG_SPI_RSPI=3Dy
> +# CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_PINCTRL_DA9062=3Dy
> +CONFIG_POWER_RESET=3Dy
> +CONFIG_POWER_RESET_SYSCON=3Dy
> +CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> +CONFIG_POWER_SUPPLY=3Dy
> +CONFIG_THERMAL=3Dy
> +CONFIG_THERMAL_DEBUGFS=3Dy
> +CONFIG_CPU_THERMAL=3Dy
> +CONFIG_DA9062_THERMAL=3Dy
> +CONFIG_RZG2L_THERMAL=3Dy
> +CONFIG_WATCHDOG=3Dy
> +CONFIG_DA9062_WATCHDOG=3Dy
> +CONFIG_RENESAS_RZG2LWDT=3Dy
> +CONFIG_MFD_DA9062=3Dy
> +CONFIG_RZ_MTU3=3Dy
> +CONFIG_REGULATOR=3Dy
> +CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> +CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> +CONFIG_SOUND=3Dy
> +CONFIG_SND=3Dy
> +# CONFIG_SND_PCM_TIMER is not set
> +# CONFIG_SND_SUPPORT_OLD_API is not set
> +# CONFIG_SND_PROC_FS is not set
> +# CONFIG_SND_CTL_FAST_LOOKUP is not set
> +# CONFIG_SND_DRIVERS is not set
> +# CONFIG_SND_PCI is not set
> +# CONFIG_SND_SPI is not set
> +# CONFIG_SND_USB is not set
> +CONFIG_SND_SOC=3Dy
> +CONFIG_SND_SOC_RZ=3Dy
> +CONFIG_SND_SOC_WM8978=3Dy
> +CONFIG_SND_SIMPLE_CARD=3Dy
> +CONFIG_USB=3Dy
> +CONFIG_USB_OTG=3Dy
> +CONFIG_USB_XHCI_HCD=3Dy
> +CONFIG_USB_XHCI_PLATFORM=3Dy
> +CONFIG_USB_EHCI_HCD=3Dy
> +CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> +CONFIG_USB_OHCI_HCD=3Dy
> +CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> +CONFIG_USB_RENESAS_USBHS=3Dy
> +CONFIG_USB_STORAGE=3Dy
> +CONFIG_USB_UAS=3Dy
> +CONFIG_USB_GADGET=3Dy
> +CONFIG_USB_RENESAS_USBHS_UDC=3Dy
> +CONFIG_MMC=3Dy
> +CONFIG_MMC_SDHI=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_DRV_DA9063=3Dy
> +CONFIG_DMADEVICES=3Dy
> +CONFIG_RZ_DMAC=3Dy
> +CONFIG_SYNC_FILE=3Dy
> +CONFIG_COMMON_CLK_VC3=3Dy
> +CONFIG_RENESAS_OSTM=3Dy
> +CONFIG_MAILBOX=3Dy
> +CONFIG_RPMSG_CHAR=3Dy
> +CONFIG_RPMSG_CTRL=3Dy
> +CONFIG_RPMSG_VIRTIO=3Dy
> +CONFIG_ARCH_R9A07G043=3Dy
> +CONFIG_EXTCON=3Dy
> +CONFIG_MEMORY=3Dy
> +CONFIG_RENESAS_RPCIF=3Dy
> +CONFIG_IIO=3Dy
> +CONFIG_RZG2L_ADC=3Dy
> +CONFIG_RESET_RZG2L_USBPHY_CTRL=3Dy
> +CONFIG_RESET_SIMPLE=3Dy
> +CONFIG_PHY_RCAR_GEN3_USB2=3Dy
> +CONFIG_EXT4_FS=3Dy
> +CONFIG_EXT4_FS_POSIX_ACL=3Dy
> +CONFIG_EXT4_FS_SECURITY=3Dy
> +CONFIG_AUTOFS_FS=3Dy
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_TMPFS=3Dy
> +CONFIG_TMPFS_POSIX_ACL=3Dy
> +CONFIG_HUGETLBFS=3Dy
> +CONFIG_NFS_FS=3Dy
> +CONFIG_NFS_V2=3Dy
> +CONFIG_NFS_V4=3Dy
> +CONFIG_NFS_V4_1=3Dy
> +CONFIG_NFS_V4_2=3Dy
> +CONFIG_ROOT_NFS=3Dy
> +# CONFIG_NFS_V4_2_READ_PLUS is not set
> +CONFIG_9P_FS=3Dy
> +CONFIG_NLS_CODEPAGE_437=3Dy
> +CONFIG_NLS_ISO8859_1=3Dy
> +CONFIG_SECURITY=3Dy
> +CONFIG_SECURITY_SELINUX=3Dy
> +CONFIG_SECURITY_APPARMOR=3Dy
> +CONFIG_DEFAULT_SECURITY_DAC=3Dy
> +CONFIG_CRYPTO_SHA1=3Dy
> +CONFIG_CRYPTO_USER_API_HASH=3Dy
> +CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> +CONFIG_PRINTK_TIME=3Dy
> +CONFIG_MAGIC_SYSRQ=3Dy
> +CONFIG_DEBUG_FS=3Dy
> +CONFIG_DEBUG_PAGEALLOC=3Dy
> +CONFIG_SCHED_STACK_END_CHECK=3Dy
> +CONFIG_DEBUG_VM=3Dy
> +CONFIG_DEBUG_VM_PGFLAGS=3Dy
> +CONFIG_DEBUG_MEMORY_INIT=3Dy
> +CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> +CONFIG_WQ_WATCHDOG=3Dy
> +CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> +CONFIG_DEBUG_TIMEKEEPING=3Dy
> +CONFIG_DEBUG_RT_MUTEXES=3Dy
> +CONFIG_DEBUG_SPINLOCK=3Dy
> +CONFIG_DEBUG_MUTEXES=3Dy
> +CONFIG_DEBUG_RWSEMS=3Dy
> +CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> +CONFIG_DEBUG_LIST=3Dy
> +CONFIG_DEBUG_PLIST=3Dy
> +CONFIG_DEBUG_SG=3Dy
> +CONFIG_RCU_EQS_DEBUG=3Dy
> +# CONFIG_FTRACE is not set
> +CONFIG_MEMTEST=3Dy
> --
> 2.34.1
>
>

